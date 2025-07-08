---@class cl_functions
---@field setCounter fun(seconds: number)
---@field hideCounter function
local cl_functions = {};

cl_functions.setCounter = function (seconds)
    lib.showTextUI(locale('afk_seconds_left', seconds));
end;

cl_functions.hideCounter = function ()
    lib.hideTextUI();
end;

return cl_functions;