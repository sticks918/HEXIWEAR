/************************************************************************************
*************************************************************************************
* Include
*************************************************************************************
************************************************************************************/

#include "ble_general.h"
#include "gatt_db_app_interface.h"
#include "gatt_server_interface.h"
#include "gap_interface.h"
#include "battery_interface.h"
#include "gatt_uuid128.h"
#include "gatt_db_handles.h"
#include "FunctionLib.h"
#include "fsl_lpuart_driver.h"

#include "alert_service.h"
#include "common_service.h"


/************************************************************************************
*************************************************************************************
* Private memory declarations
*************************************************************************************
************************************************************************************/

/*! Health Service - Subscribed Client*/
static deviceId_t mAls_SubscribedClientId;

/*! *********************************************************************************
*************************************************************************************
* Public Functions definitions
*************************************************************************************
********************************************************************************** */

/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

bleResult_t Als_Start (void)
{
    return gBleSuccess_c;
}

/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

bleResult_t Als_Stop(void)
{
    mAls_SubscribedClientId = gInvalidDeviceId_c;
    return gBleSuccess_c;
}

/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

bleResult_t Als_Subscribe(deviceId_t clientDeviceId)
{
    mAls_SubscribedClientId = clientDeviceId;
    return gBleSuccess_c;
}

/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

bleResult_t Als_Unsubscribe(void)
{
    mAls_SubscribedClientId = gInvalidDeviceId_c;
    return gBleSuccess_c;
}

/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

bleResult_t Als_RecordOutAlert(uint8_t * data)
{
    bleResult_t result;
    
    result = CommonService_RecordCharValue(mAls_SubscribedClientId, service_alert, gBleCustom_AlertOutUUID_d,  data, gBleCustom_AlertOutLength_d);
    
    return result;
}

/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

bleResult_t Als_HandleInAlert(uint8_t * data)
{
    static hostInterface_packet_t tmpPacket = {.start1 = 0x55, .start2 = 0xAA};
    
    tmpPacket.type = packetType_alertIn;
    tmpPacket.length = gBleCustom_AlertInLength_d;
    tmpPacket.data[gBleCustom_AlertInLength_d] = gHostInterface_trailerByte;
    
    FLib_MemCpy(tmpPacket.data, data, gBleCustom_AlertInLength_d);
    
    return (bleResult_t)HostInterface_TxQueueMsgPut((hostInterface_packet_t *)&tmpPacket);
}

/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
