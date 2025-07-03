from robot.api.deco import keyword
from datetime import datetime, timedelta

@keyword
def this_thursday():
    today = datetime.now()
    days_until_thursday = (3 - today.weekday()) % 7
    return (today + timedelta(days=days_until_thursday)).strftime('%Y-%m-%d')
