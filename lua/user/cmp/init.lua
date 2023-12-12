local api = vim.api
local group = api.nvim_create_augroup('Codetime', { clear = true })

local start = os.time()
local floor = math.floor
local stopedfor
local diff = 0

local function disp_time(time)
    local days = floor(time / 86400)
    local remaining = time % 86400
    local hours = floor(remaining / 3600)
    remaining = remaining % 3600
    local minutes = floor(remaining / 60)
    remaining = remaining % 60
    local seconds = remaining
    if (hours < 10) then
        hours = "0" .. tostring(hours)
    end
    if (minutes < 10) then
        minutes = "0" .. tostring(minutes)
    end
    if (seconds < 10) then
        seconds = "0" .. tostring(seconds)
    end

    return days, hours, minutes, seconds
end

function Code_time()
    -- TODO: store time in file just in case.
    -- the inforamtion that will be store is :
    --  project naem , start time
    -- TODO: make this more user friendly
    local d, h, m, s = disp_time((os.difftime(
        start, os.time()
    ) * -1))
    print('code time :' .. d .. ":" .. h .. ":" .. m .. ":" .. s)
end

vim.keymap.set('n', '<leader>a', Code_time)
-- TODO: Add writing and editing file events
api.nvim_create_autocmd('BufEnter', {
    group = group,
    callback = function()
        local fileextension = vim.fn.expand('%:e')
        if fileextension ~= "" then
            -- calulate the stop time
            diff = diff + (os.difftime(stopedfor, os.time()) * -1)
            -- print(("%02d:%02d:%02d"):format(buzztimer.hour, buzztimer.min, buzztimer.sec))
        end

        if fileextension == "" then
            stopedfor = os.time()
        end
    end
})
