"""
This example shows two ways to redirect flows to other destinations.
"""
from libmproxy.models import HTTPResponse
from netlib.http import Headers

def request(context, flow):
    resp = HTTPResponse(http_version="HTTP/1.1", status_code=201, reason="Created", headers=Headers(Content_Type="application/json"), content=flow.request.content)
    flow.reply(resp)
