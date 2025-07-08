---@class sv_functions
---@field kickPlayer fun(source: number, reason: string)
local sv_functions = {};

sv_functions.kickPlayer = function (source, reason)
    DropPlayer(source, reason)
end;

return sv_functions;