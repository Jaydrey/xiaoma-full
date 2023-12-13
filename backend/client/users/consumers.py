import json
from channels.generic.websocket import AsyncWebsocketConsumer


class UpdateUserCurrentLocationCOnsumer(AsyncWebsocketConsumer):
    async def connect(self):
        await self.accept()
        self.send("Connection accepted")
        print("Connection accepted")

    async def disconnect(self, code):
        pass
        # return await super().disconnect(code)

    async def user_location_update(self, event: dict):
        await self.send(text_data=json.dumps(event["message"]))
