---@class Functions
---@field notify fun(message: string, type: string, duration: number | 5000)
local cl_functions = {};

cl_functions.setCounter = function (seconds)
    lib.showTextUI(locale('afk_seconds_left', seconds));
end;

cl_functions.hideCounter = function ()
    lib.hideTextUI();
end;

return cl_functions;