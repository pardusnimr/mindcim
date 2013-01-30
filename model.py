import web

db = web.database(dbn='mysql', db='olddcim', user='root', pw='d7hero', port=3306, host='127.0.0.1')

def get_devices():
    return db.select('fac_device')
    
def get_device(DeviceID):
    try:
        return db.select('fac_device', where='DeviceID=$DeviceID', vars=locals())[0]
    except IndexError:
        return None
    
    