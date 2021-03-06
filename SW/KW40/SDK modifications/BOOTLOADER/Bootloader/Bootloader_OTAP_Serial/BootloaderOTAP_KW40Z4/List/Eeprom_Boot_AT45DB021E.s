///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       12/Jan/2016  08:59:55
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\src\eeprom\Eeprom_Boot_AT45DB021E.c
//    Command line =  
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\src\eeprom\Eeprom_Boot_AT45DB021E.c
//        -D MCU_MKW40Z160 -D gEepromType_d=gEepromDevice_M25P80_c
//        --preprocess=cl
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\BootloaderOTAP_KW40Z4\List\
//        -lC
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\BootloaderOTAP_KW40Z4\List\
//        -lA
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\BootloaderOTAP_KW40Z4\List\
//        --diag_suppress Pa039 -o
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\BootloaderOTAP_KW40Z4\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0+ -e --fpu=None -I
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\src\OtapSerialBootloader\
//        -I
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\src\spi\
//        -I
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\src\eeprom\
//        -I
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\src\flash\
//        -I
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\src\include\
//        -I
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\src\
//        -I
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\
//        -I
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\src\include\cfg\
//        -On --c89
//    List file    =  
//        C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\BootloaderOTAP_KW40Z4\List\Eeprom_Boot_AT45DB021E.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1


        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// C:\Freescale\KW40Z_Connectivity_Software_1.0.1\ConnSw\framework\Bootloader\Bootloader_OTAP_Serial\src\eeprom\Eeprom_Boot_AT45DB021E.c
//    1 /*!
//    2 * Copyright (c) 2015, Freescale Semiconductor, Inc.
//    3 * All rights reserved.
//    4 *
//    5 * \file EEPROM_AT45DB021E.c
//    6 * This is a source file which implements the driver for the AT45DB021E memory.
//    7 *
//    8 * Redistribution and use in source and binary forms, with or without modification,
//    9 * are permitted provided that the following conditions are met:
//   10 *
//   11 * o Redistributions of source code must retain the above copyright notice, this list
//   12 *   of conditions and the following disclaimer.
//   13 *
//   14 * o Redistributions in binary form must reproduce the above copyright notice, this
//   15 *   list of conditions and the following disclaimer in the documentation and/or
//   16 *   other materials provided with the distribution.
//   17 *
//   18 * o Neither the name of Freescale Semiconductor, Inc. nor the names of its
//   19 *   contributors may be used to endorse or promote products derived from this
//   20 *   software without specific prior written permission.
//   21 *
//   22 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//   23 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//   24 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//   25 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
//   26 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//   27 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//   28 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
//   29 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//   30 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//   31 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//   32 */
//   33 
//   34 
//   35 /*! *********************************************************************************
//   36 *************************************************************************************
//   37 * Include
//   38 *************************************************************************************
//   39 ********************************************************************************** */
//   40 #include "Eeprom_Boot.h"
//   41 
//   42 #if gEepromType_d == gEepromDevice_AT45DB021E_c
//   43 
//   44 #include "SPI.h"
//   45 
//   46 /*! *********************************************************************************
//   47 *************************************************************************************
//   48 * Private macros
//   49 *************************************************************************************
//   50 ********************************************************************************** */
//   51 #define  gEepromWriteEnable_d   0
//   52 
//   53 #define  EEPROM_RDSR            0xD7
//   54 #define  EEPROM_READ            0x03
//   55 #define  EEPROM_READ_HF         0x0B
//   56 
//   57 #define  EEPROM_ERASE_256B      0x81
//   58 #define  EEPROM_ERASE_2K        0x50
//   59 
//   60 #define  EEPROM_WRITE_BYTES     0x02
//   61 
//   62 #define  EEPROM_BUSY_FLAG_MASK  0x80
//   63 #define  EEPROM_PAGE_SIZE       (256)
//   64 #define  EEPROM_BLOCK_SIZE      (8*EEPROM_PAGE_SIZE)
//   65 #define  EEPROM_PAGE_MASK       (EEPROM_PAGE_SIZE - 1)
//   66 
//   67 /* adress mask */
//   68 #define  ADDRESS_MASK 0x000000FF
//   69 
//   70 
//   71 /****************************** SPI MACROS ***********************************/
//   72 #define mEepromSpiInstance_c 0
//   73 
//   74 
//   75 
//   76 /******************************************************************************
//   77 *******************************************************************************
//   78 * Private Prototypes
//   79 *******************************************************************************
//   80 ******************************************************************************/
//   81 #if gEepromWriteEnable_d
//   82 static ee_err_t EEPROM_PrepareForWrite(uint32_t NoOfBytes, uint32_t Addr);
//   83 static ee_err_t EEPROM_WritePage(uint32_t NoOfBytes, uint32_t Addr, uint8_t *Outbuf);
//   84 #endif
//   85 static ee_err_t EEPROM_WaitForReady(void);
//   86 static uint16_t EEPROM_ReadStatusReq(void);
//   87 static void     EEPROM_Command(uint8_t opCode, uint32_t Addr);
//   88 
//   89 
//   90 /*! *********************************************************************************
//   91 *************************************************************************************
//   92 * Private Memory Declarations
//   93 *************************************************************************************
//   94 ********************************************************************************** */
//   95 #if gEepromWriteEnable_d
//   96 static uint8_t mEepromEraseBitmap[64];
//   97 #endif
//   98 
//   99 
//  100 /*! *********************************************************************************
//  101 *************************************************************************************
//  102 * Public Functions
//  103 *************************************************************************************
//  104 ********************************************************************************** */
//  105 
//  106 /*****************************************************************************
//  107 *  EEPROM_Init
//  108 *
//  109 *  Initializes the EEPROM peripheral
//  110 *
//  111 *****************************************************************************/
//  112 ee_err_t EEPROM_Init(void)
//  113 {
//  114     ee_err_t retval;
//  115     const uint8_t cmd[] = {0x3D, 0x2A, 0x80, 0xA6};
//  116     spi_user_config_t config;
//  117 #if gEepromWriteEnable_d
//  118     uint32_t i;
//  119     
//  120     // Mark Flash as Unerased
//  121     for(i = 0; i < 64; i++)
//  122         mEepromEraseBitmap[i] = 0;
//  123 #endif
//  124     
//  125     config.busFrequencyKHz = 8000;
//  126     config.direction = kSpiMsbFirst;
//  127     config.phase = kSpiClockPhase_FirstEdge;
//  128     config.polarity = kSpiClockPolarity_ActiveHigh;
//  129     
//  130     spi_master_init(mEepromSpiInstance_c);
//  131     spi_master_configure_bus(mEepromSpiInstance_c, &config);
//  132     
//  133     retval = EEPROM_WaitForReady();
//  134     if (retval != ee_ok)
//  135         return retval;
//  136 
//  137     // Set page size to 512bits:
//  138     assert_cs();
//  139     spi_master_transfer(mEepromSpiInstance_c, cmd, NULL, sizeof(cmd));
//  140     deassert_cs();
//  141     
//  142     return ee_ok;
//  143 }
//  144 
//  145 /*****************************************************************************
//  146 *  EEPROM_ChipErase
//  147 *
//  148 *  Erase all memory to 0xFF
//  149 *
//  150 *****************************************************************************/
//  151 ee_err_t EEPROM_ChipErase(void)
//  152 {
//  153     const uint8_t cmd[] = {0xC7, 0x94, 0x80, 0x9A};
//  154     while (EEPROM_isBusy());
//  155     
//  156     assert_cs();
//  157     spi_master_transfer(mEepromSpiInstance_c, cmd, NULL, sizeof(cmd));
//  158     deassert_cs();
//  159 
//  160     return ee_ok;
//  161 }
//  162 
//  163 /*****************************************************************************
//  164 *  EEPROM_EraseBlock
//  165 *
//  166 *  Erase a block of memory to 0xFF
//  167 *
//  168 *****************************************************************************/
//  169 ee_err_t EEPROM_EraseBlock(uint32_t Addr, uint32_t size)
//  170 {
//  171     uint8_t cmd[4];
//  172     
//  173     while (EEPROM_isBusy());
//  174     
//  175     switch (size)
//  176     {
//  177     case EEPROM_BLOCK_SIZE:
//  178         cmd[0] = EEPROM_ERASE_2K;
//  179         break;
//  180     case EEPROM_PAGE_SIZE:
//  181         cmd[0] = EEPROM_ERASE_256B;
//  182         break;
//  183     default:
//  184         return ee_error;
//  185     }
//  186 
//  187     cmd[1] = (Addr >> 16) & ADDRESS_MASK;
//  188     cmd[2] = (Addr >>  8) & ADDRESS_MASK;
//  189     cmd[3] = (Addr >>  0) & ADDRESS_MASK;
//  190 
//  191     assert_cs();
//  192     spi_master_transfer(mEepromSpiInstance_c, cmd, NULL, sizeof(cmd));
//  193     deassert_cs();
//  194     
//  195     return ee_ok;
//  196 }
//  197 
//  198 /*****************************************************************************
//  199 *  EEPROM_WriteData
//  200 *
//  201 *  Writes a data buffer into EEPROM, at a given address
//  202 *
//  203 *****************************************************************************/
//  204 #if gEepromWriteEnable_d
//  205 ee_err_t EEPROM_WriteData(uint32_t NoOfBytes, uint32_t Addr, uint8_t *Outbuf)
//  206 {
//  207     ee_err_t retval;
//  208     
//  209     if (NoOfBytes == 0)
//  210         return ee_ok;
//  211     
//  212     while (EEPROM_isBusy());
//  213     
//  214     retval = EEPROM_PrepareForWrite(NoOfBytes, Addr);
//  215     if (retval != ee_ok)
//  216         return retval;
//  217     
//  218     while ((Addr & EEPROM_PAGE_MASK) + NoOfBytes > EEPROM_PAGE_MASK)
//  219     {
//  220         uint32_t bytes = EEPROM_PAGE_SIZE - (Addr & EEPROM_PAGE_MASK);
//  221         
//  222         retval = EEPROM_WritePage(bytes, Addr, Outbuf);
//  223         NoOfBytes -= bytes;
//  224         Addr += bytes;
//  225         Outbuf += bytes;
//  226         
//  227         if (retval != ee_ok)
//  228             return retval;
//  229     }
//  230     
//  231     retval = EEPROM_WritePage(NoOfBytes, Addr, Outbuf);
//  232     
//  233     return retval;
//  234 }
//  235 #endif
//  236 
//  237 /*****************************************************************************
//  238 *  EEPROM_ReadData
//  239 *
//  240 *  Reads a data buffer from EEPROM, from a given address
//  241 *
//  242 *****************************************************************************/
//  243 ee_err_t EEPROM_ReadData(uint16_t NoOfBytes, uint32_t Addr, uint8_t *inbuf)
//  244 {
//  245     
//  246     while (EEPROM_isBusy());
//  247     
//  248     EEPROM_Command(EEPROM_READ,Addr);
//  249     
//  250     spi_master_transfer(mEepromSpiInstance_c, NULL, inbuf, NoOfBytes);
//  251     deassert_cs();
//  252 
//  253     return ee_ok;
//  254 }
//  255 
//  256 /*****************************************************************************
//  257 *  EEPROM_ReadStatusReq
//  258 *
//  259 *
//  260 *****************************************************************************/
//  261 uint8_t EEPROM_isBusy(void)
//  262 {
//  263     return !(EEPROM_ReadStatusReq() & EEPROM_BUSY_FLAG_MASK);
//  264 }
//  265 
//  266 /*! *********************************************************************************
//  267 *************************************************************************************
//  268 * Private Functions
//  269 *************************************************************************************
//  270 ********************************************************************************** */
//  271 
//  272 /*****************************************************************************
//  273 *  EEPROM_ReadStatusReq
//  274 *
//  275 *
//  276 *****************************************************************************/
//  277 static uint16_t EEPROM_ReadStatusReq(void)
//  278 {
//  279     uint16_t status = EEPROM_RDSR;
//  280     
//  281     assert_cs();
//  282     spi_master_transfer(mEepromSpiInstance_c, (uint8_t*)&status, NULL, 1);
//  283     spi_master_transfer(mEepromSpiInstance_c, NULL, (uint8_t*)&status, 2);
//  284     deassert_cs();
//  285 
//  286     return status;
//  287 }
//  288 
//  289 /*****************************************************************************
//  290 *  EEPROM_WriteData
//  291 *
//  292 *  Writes a data buffer into the External Memory, at a given address
//  293 *
//  294 *****************************************************************************/
//  295 #if gEepromWriteEnable_d
//  296 static ee_err_t EEPROM_PrepareForWrite(uint32_t NoOfBytes, uint32_t Addr)
//  297 {
//  298     uint32_t i;
//  299     ee_err_t ret = ee_ok;
//  300     uint32_t startBlk, endBlk;
//  301     
//  302     // Obtain the block number
//  303     startBlk = Addr >> 12;
//  304     endBlk   = (Addr + NoOfBytes) >> 12;
//  305     
//  306     for(i = startBlk; i <= endBlk; i++)
//  307         if ( (mEepromEraseBitmap[i/8] & (1 << (i%8) ) ) == 0)
//  308         {
//  309             ret = EEPROM_EraseBlock(i * EEPROM_BLOCK_SIZE, EEPROM_BLOCK_SIZE);
//  310             if (ret != ee_ok)
//  311                 return ret;
//  312             
//  313             mEepromEraseBitmap[i/8] |= 1 << (i%8);
//  314             while (EEPROM_isBusy());
//  315         }
//  316     
//  317     return ret;
//  318 }
//  319 #endif
//  320 
//  321 /*****************************************************************************
//  322 *  EEPROM_WritePage
//  323 *
//  324 *  Writes maximum 256 bytes into a EEPROM page
//  325 *
//  326 *****************************************************************************/
//  327 #if gEepromWriteEnable_d
//  328 static ee_err_t EEPROM_WritePage(uint32_t NoOfBytes, uint32_t Addr, uint8_t *Outbuf)
//  329 {
//  330     
//  331     if (NoOfBytes == 0)
//  332         return ee_ok;
//  333     
//  334     while (EEPROM_isBusy());
//  335     
//  336     //SPI_Send_byte(EEPROM_WRITE_ENABLE,DEASSERT_CS);
//  337     
//  338     EEPROM_Command(EEPROM_WRITE_BYTES, Addr); //CS will remain ASSERTED
//  339 
//  340     spi_master_transfer(mEepromSpiInstance_c, Outbuf, NULL, NoOfBytes);
//  341     deassert_cs();
//  342     
//  343     return ee_ok;
//  344 }
//  345 #endif
//  346 
//  347 /*****************************************************************************
//  348 *  EEPROM_WaitForReady
//  349 *
//  350 *
//  351 *****************************************************************************/
//  352 static ee_err_t EEPROM_WaitForReady(void)
//  353 {
//  354     volatile uint16_t wait = 0x400; // near 50 ms @ 50 us/cycle
//  355     
//  356     /* Byte1 - Bit:   7       6      5:2       1         0
//  357     *             RDY/BUSY  COMP  DENSITY  PROTECT  PAGE_SIZE
//  358     *
//  359     * Byte2 - Bit:   7       6    5    4    3    2    1    0
//  360     *             RDY/BUSY  RES  EPE  RES  SLE  PS2  PS1  ES
//  361     */
//  362     
//  363     while( EEPROM_isBusy() && (wait !=0) )
//  364     {
//  365         wait--;
//  366     }
//  367     
//  368     if(wait != 0)
//  369     {
//  370         return ee_ok;
//  371     }
//  372     return ee_error;
//  373 }
//  374 
//  375 
//  376 /*****************************************************************************
//  377 *  EEPROM_Command
//  378 *
//  379 *
//  380 *****************************************************************************/
//  381 static void EEPROM_Command(uint8_t opCode, uint32_t Addr)
//  382 {
//  383     uint8_t cmd[4];
//  384     
//  385     cmd[0] = opCode;
//  386     cmd[1] = (Addr >> 16) & ADDRESS_MASK;
//  387     cmd[2] = (Addr >>  8) & ADDRESS_MASK;
//  388     cmd[3] = (Addr >>  0) & ADDRESS_MASK;
//  389 
//  390     assert_cs();
//  391     spi_master_transfer(mEepromSpiInstance_c, cmd, NULL, sizeof(cmd));
//  392     /* CS will remain asserted to be able to send the data */
//  393 }
//  394 
//  395 #endif
//  396 /* EOF: Eeprom_AT45DB021E */ 
//  397 
// 
//
// 
//
//
//Errors: none
//Warnings: none
