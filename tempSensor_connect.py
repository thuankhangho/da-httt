##Setup##
import sys
from Adafruit_IO import MQTTClient

##TempSensor's temp##
import random
import time

##Bien toan cuc##
AIO_FEED_ID = "tempsensor"
AIO_USERNAME = "ThuanKhang"
AIO_KEY = "aio_AznZ87qkH5bwayfK5ebDVitP0o04"

##Ham chuc nang##
def connected(client):
    print("Ket noi thanh cong...")
    client.subscribe(AIO_FEED_ID)

def subscribe(client, userdata, mid, granted_qos):
    print("Subscribe thanh cong...")

def disconnected(client):
    print("Ngat ket noi...")
    sys.exit(1)

def message (client, feed_id, payload):
    print("Nhan du lieu: " + payload)
    
##Cau hinh Gateway##
client = MQTTClient(AIO_USERNAME, AIO_KEY)
client.on_connect = connected
client.on_disconnect = disconnected
client.on_message = message
client.on_subscribe = subscribe
client.connect()
client.loop_background()

while True:
    value = random.randint(0, 100) #Tra ve nhiet do tu 1 - 100
    print("Cap nhat: ", value)
    client.publish("tempsensor-temp", value)
    time.sleep(30) #Delay 30s