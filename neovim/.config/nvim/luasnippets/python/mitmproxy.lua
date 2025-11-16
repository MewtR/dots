local mitmproxy_function_template = s("mitmproxy", fmt([[
from mitmproxy import http

def request(flow: http.HTTPFlow) -> None:
    request: http.Request = flow.request
    return

def response(flow: http.HTTPFlow) -> None:
    request: http.Request = flow.request
    response: http.Response | None = flow.response
    return
]], {}))

return {mitmproxy_function_template}
