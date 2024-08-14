/* USER CODE BEGIN Header */
/**
-----------------------------------------------------------------------------

Authors: Prasad kulkarni , Onkar chougale , Lalit Deshpande ,Karan Solanki


CODE: receiving distance with CAN (front, rear) and displaying on LCD and controlling Buzzer
Date: 05-08-2024
--------------------------------------------------------------------------
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
/* Private includes ----------------------------------------------------------*/

/* USER CODE BEGIN Includes */
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <lcd_i2c.h>				/* LCD required functionality */

#include "FreeRTOS.h"				/* RTOS Related configurations */
#include "task.h"
#include "timers.h"
#include "queue.h"
#include "semphr.h"
#include "event_groups.h"
#include "SEGGER_SYSVIEW.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/

/* USER CODE BEGIN PM */
/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
CAN_HandleTypeDef hcan2;

I2C_HandleTypeDef hi2c1;

/* USER CODE BEGIN PV */

//uint8_t Queue_rx[8];
uint8_t RxData[8];
uint32_t min_distance;				/* this variable will store minimum distance of two UltraSonic sensor */
float distance_rear;				/* received rear distance via CAN */
float distance_front; 				/* received rear distance via CAN */
uint32_t period;
extern I2C_HandleTypeDef hi2c1;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_CAN2_Init(void);
static void MX_I2C1_Init(void);
/* USER CODE BEGIN PFP */

/* Private function prototypes -----------------------------------------------*/


#define STACK_SIZE 128

void Deferred_Task( void* argument );
void WasteFullLED( void* argument );
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_CAN2_Init(void);
void CAN_Filter_Config(void);
void Error_Handler(void);

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

//static QueueHandle_t Data_transmitt = NULL;

TaskHandle_t xDeferrefTaskHandle = NULL;

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_CAN2_Init();
  MX_I2C1_Init();
  /* USER CODE BEGIN 2 */
  /* segger system configuration for segger system view  */
  SEGGER_SYSVIEW_Conf();

  /* making priority of task to 4
   * With FreeRTOS, it's important that critical system interrupts
   *(like the SysTick handler or PendSV handler) are not blocked by other less
   * critical interrupts. By using NVIC_PRIORITYGROUP_4, you can assign the lowest preemption
   * priority to FreeRTOS interrupts, ensuring they are not blocked.*/
  HAL_NVIC_SetPriorityGrouping(NVIC_PRIORITYGROUP_4);

  /* filtering the CAN configurations before starting the can */
  CAN_Filter_Config();

  /**
    * @brief  Start the CAN module.
    * @param  hcan pointer to an CAN_HandleTypeDef structure that contains
    *         the configuration information for the specified CAN.
    * @retval HAL status
    */
  if(HAL_CAN_Start(&hcan2) != HAL_OK)
  {
	  Error_Handler();
  }
  /**
    * @brief  Enable interrupts.
    * @param  hcan pointer to an CAN_HandleTypeDef structure that contains
    *         the configuration information for the specified CAN.
    * @param  ActiveITs indicates which interrupts will be enabled.
    *         This parameter can be any combination of @arg CAN_Interrupts.
    * @retval HAL status
    */
  if(HAL_CAN_ActivateNotification(&hcan2, CAN_IT_RX_FIFO0_MSG_PENDING)!=HAL_OK)
  {
	  Error_Handler();
  }

  //creating tasks
  assert_param(xTaskCreate(Deferred_Task, "Task for Deferred work", STACK_SIZE, NULL, tskIDLE_PRIORITY + 3, &xDeferrefTaskHandle) == pdPASS);
  assert_param(xTaskCreate(WasteFullLED, "LED_Blink on low priority", STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, NULL) == pdPASS);

  //Data_transmitt= xQueueCreate(4,sizeof(float));


  //Starting Scheduler
  vTaskStartScheduler();

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */

  while (1)
  {
	  /* program execution should not come here */
  }
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */

  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief CAN2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_CAN2_Init(void)
{

  /* USER CODE BEGIN CAN2_Init 0 */

  /* USER CODE END CAN2_Init 0 */

  /* USER CODE BEGIN CAN2_Init 1 */

  /* USER CODE END CAN2_Init 1 */
  hcan2.Instance = CAN2;
  hcan2.Init.Prescaler = 24;
  hcan2.Init.Mode = CAN_MODE_NORMAL;
  hcan2.Init.SyncJumpWidth = CAN_SJW_1TQ;
  hcan2.Init.TimeSeg1 = CAN_BS1_13TQ;
  hcan2.Init.TimeSeg2 = CAN_BS2_2TQ;
  hcan2.Init.TimeTriggeredMode = DISABLE;
  hcan2.Init.AutoBusOff = DISABLE;
  hcan2.Init.AutoWakeUp = DISABLE;
  hcan2.Init.AutoRetransmission = DISABLE;
  hcan2.Init.ReceiveFifoLocked = DISABLE;
  hcan2.Init.TransmitFifoPriority = DISABLE;
  if (HAL_CAN_Init(&hcan2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN CAN2_Init 2 */

  /* USER CODE END CAN2_Init 2 */

}

/**
  * @brief I2C1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2C1_Init(void)
{
  /* USER CODE BEGIN I2C1_Init 0 */

  /* USER CODE END I2C1_Init 0 */

  /* USER CODE BEGIN I2C1_Init 1 */

  /* USER CODE END I2C1_Init 1 */
  hi2c1.Instance = I2C1;
  hi2c1.Init.ClockSpeed = 100000;
  hi2c1.Init.DutyCycle = I2C_DUTYCYCLE_2;
  hi2c1.Init.OwnAddress1 = 0;
  hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c1.Init.OwnAddress2 = 0;
  hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN I2C1_Init 2 */

  /* USER CODE END I2C1_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  /*USER CODE BEGIN MX_GPIO_Init_1 */

  /*USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOD, GPIO_PIN_12|GPIO_PIN_13|GPIO_PIN_14|GPIO_PIN_15, GPIO_PIN_RESET);

  /*Configure GPIO pins : PD12 PD13 PD14 PD15 */
  GPIO_InitStruct.Pin = GPIO_PIN_12|GPIO_PIN_13|GPIO_PIN_14|GPIO_PIN_15;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

/* USER CODE BEGIN MX_GPIO_Init_2 */

/* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */
void LCD_Init(void)
{
	lcd_init();
}


/**
  * @brief This function configures the CAN filter
  * @retval None
  */

void CAN_Filter_Config(void)
{
  CAN_FilterTypeDef can2_filter_init;
  can2_filter_init.FilterActivation = ENABLE;
  can2_filter_init.FilterBank = 14;
  can2_filter_init.FilterFIFOAssignment = CAN_RX_FIFO0;
  can2_filter_init.FilterIdHigh = 0x0000;
  can2_filter_init.FilterIdLow = 0x0000;
  can2_filter_init.FilterMaskIdHigh = 0x0000;
  can2_filter_init.FilterMaskIdLow = 0x0000;
  can2_filter_init.FilterMode = CAN_FILTERMODE_IDMASK;
  can2_filter_init.FilterScale = CAN_FILTERSCALE_32BIT;
  can2_filter_init.SlaveStartFilterBank=14;

  if(HAL_CAN_ConfigFilter(&hcan2, &can2_filter_init) != HAL_OK)
  {
	Error_Handler();
  }
}



/* The vTaskDelay function is used to create a delay,
 * allowing the RTOS to manage the task's timing. */
void WasteFullLED(void *NotUsed)
{
	while(1)
	{
		HAL_GPIO_WritePin(GPIOD, GPIO_PIN_15, SET);
		vTaskDelay(100/portTICK_PERIOD_MS);
		HAL_GPIO_WritePin(GPIOD, GPIO_PIN_15, RESET);
		vTaskDelay(100/portTICK_PERIOD_MS);
	}
}

/* 1->This task waits for a notification from an ISR using ulTaskNotifyTake,
 * which blocks the task until the notification is received.
 * 2->Once notified, it extracts two float values from RxData,
 * representing distances for the front and rear */
void Deferred_Task(void *argument)
{
	char buffer[20];

	while(1)
	{
		SEGGER_SYSVIEW_PrintfHost("Waiting for mque receive\n");

		ulTaskNotifyTake(pdTRUE,portMAX_DELAY);

		memcpy(&distance_front,&RxData[0],sizeof(float));
		memcpy(&distance_rear,&RxData[4],sizeof(float));

		SEGGER_SYSVIEW_PrintfHost("Distance Front: %d Rear: %d",distance_front,distance_rear);

		/* The task logs the distances and then calculates the minimum distance. */
		min_distance= fmin(distance_front,distance_front);

		/* In this part of the code, the buzzer is controlled based on the min_distance value.
		 * The delay duration (period) is calculated by multiplying the min_distance by 5.
		 * This means that the closer the object, the shorter the delay, resulting in faster buzzing. */
		if(min_distance < 30)
		{
			HAL_GPIO_WritePin(GPIOD, GPIO_PIN_12, SET);
			period=(5 * min_distance);
			vTaskDelay(period/portTICK_PERIOD_MS);
			HAL_GPIO_WritePin(GPIOD, GPIO_PIN_12, RESET);
			vTaskDelay(period/portTICK_PERIOD_MS);
		}
		/* else reset the buzzer */
		else
			HAL_GPIO_WritePin(GPIOD, GPIO_PIN_12, RESET);


		/* for segger system view */
		SEGGER_SYSVIEW_PrintfHost("Distance Front: %d Rear: %d",(int)distance_front,(int)distance_rear);
		lcd_clear();
		lcd_put_cur(0, 0);
		sprintf(buffer, "Front Distance:");
		lcd_send_string(buffer);

		/* printing front distance on LCD */
		lcd_put_cur(1, 0);
		sprintf(buffer, "%d cm",(int)distance_front);
		lcd_send_string(buffer);

		lcd_put_cur(2, 0);
		sprintf(buffer, "Rear Distance:");
		lcd_send_string(buffer);

		/* printing rear distance on LCD */
		lcd_put_cur(3, 0);
		sprintf(buffer, "%d cm",(int)distance_rear);
		lcd_send_string(buffer);

		bzero(buffer,sizeof(buffer));
		vTaskDelay(100/portTICK_PERIOD_MS);

	}

}


void CAN2_RX0_IRQHandler(void)
{
    /* USER CODE BEGIN CAN2_RX0_IRQn 0 */

	/* xHigherPriorityTaskWoken is a flag used to check
	 * if a higher priority task has been woken by an ISR. It is initialized to pdFALSE */
	portBASE_TYPE xHigherPriorityTaskWoken = pdFALSE;

	/* Format and send an ISR entry event.
	 * This function is used to log the entry into the ISR using SEGGER SystemView,
	 * a real-time analysis tool*/
	SEGGER_SYSVIEW_RecordEnterISR();

	/* Declares a structure to hold the header information of the received CAN message */
	CAN_RxHeaderTypeDef RxHeader;

	/* Reads the Interrupt Enable Register (IER) of the CAN peripheral
	 *  to check which interrupts are enabled. */
	uint32_t interrupts = READ_REG(hcan2.Instance->IER);

	/* Checks if the FIFO0 message pending interrupt is enabled
	 * by using a bitwise AND operation with CAN_IT_RX_FIFO0_MSG_PENDING */
	if((interrupts & CAN_IT_RX_FIFO0_MSG_PENDING)!=0U)
	{
		/* Checks if there are any messages pending in the FIFO0 receive buffer.
		 * This is done by checking the FIFO0 Message Pending bits in the Receive FIFO 0 Register (RF0R) */
		if((hcan2.Instance->RF0R & CAN_RF0R_FMP0)!=0U)
		{
			/* Calls the HAL_CAN_GetRxMessage function to retrieve the message from FIFO0.
			 * If it fails, the Error_Handler() function is called */
			if(HAL_CAN_GetRxMessage(&hcan2, CAN_RX_FIFO0, &RxHeader, RxData)!= HAL_OK )
			{
				Error_Handler();
			}
			/* This checks if the received message has a standard ID of 0x65D, is a standard frame (IDE == CAN_ID_STD)
			 * and has a data length code (DLC) of 8. If these conditions are met, the code proceeds to process the data. */
			if((RxHeader.StdId==0x65D)&&(RxHeader.IDE==CAN_ID_STD)&&(RxHeader.DLC==8))
			{
				/* printing received data on segger for debug and user view */
				SEGGER_SYSVIEW_PrintfHost("In Interrupt\n");
				SEGGER_SYSVIEW_PrintfHost("Data: %c\n",RxData[0]);
				SEGGER_SYSVIEW_PrintfHost("Data: %c\n",RxData[4]);
				//xQueueSendFromISR(Data_transmitt, &RxData, &xHigherPriorityTaskWoken);

				/* This function is used to notify a task (referred to by xDeferrefTaskHandle) from within the ISR
				 * The xHigherPriorityTaskWoken flag is set to pdTRUE if the notified task has a higher priority than the currently running task. */
				vTaskNotifyGiveFromISR(xDeferrefTaskHandle,&xHigherPriorityTaskWoken);
				SEGGER_SYSVIEW_PrintfHost("Data Sent\n");
			}
		}
	}

	SEGGER_SYSVIEW_RecordExitISR();

	/* f xHigherPriorityTaskWoken was set to pdTRUE, this macro will cause a context
	 * switch to the higher priority task that was woken by the ISR,
	 *  ensuring that it runs immediately after the ISR completes. */
	portYIELD_FROM_ISR(xHigherPriorityTaskWoken);

  /* USER CODE END CAN2_RX0_IRQn 0 */

  /* USER CODE BEGIN CAN2_RX0_IRQn 1 */

  /* USER CODE END CAN2_RX0_IRQn 1 */
}

/* USER CODE END 4 */

/**
  * @brief  Period elapsed callback in non blocking mode
  * @note   This function is called  when TIM1 interrupt took place, inside
  * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
  * a global variable "uwTick" used as application time base.
  * @param  htim : TIM handle
  * @retval None
  */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  /* USER CODE BEGIN Callback 0 */

  /* USER CODE END Callback 0 */
  if (htim->Instance == TIM1) {
    HAL_IncTick();
  }
  /* USER CODE BEGIN Callback 1 */

  /* USER CODE END Callback 1 */
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */

  /* User can add his own implementation to report the file name and line number,

     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
