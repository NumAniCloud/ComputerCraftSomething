rednet.open("top")
mon = peripheral.wrap("right")

function getIndex(array, item) 
    n = #array
    for i = 1,n do
        if array[i] == item then
            return i
        end
    end
    return -1
end

function split(str, delimiter)
    if delimiter == nil then return {} end

    local t = {}
    i = 1
    for s in string.gmatch(str, "([^"..delimiter.."]+)") do
        t[i] = s
        i = i + 1
    end

    return t
end

args = {...}
workers = {}
for i = 1,#args do
    workers[i] = tonumber(args[i])
end

mon.clear()

while true do
    local sender_id, message, distance = rednet.receive()
    index = getIndex(workers, sender_id)
    
    print("received message from",sender_id, ":", message)

    if index ~= -1 then
        local contents = split(message, ",")
        
        if contents[1]:find("Err") ~= nil then
            mon.setTextColor(colors.red)

            mon.setCursorPos(1,index*2-1)
            mon.clearLine()
            mon.write("#"..sender_id.." sended SOS! "..contents[1])
    
            mon.setCursorPos(1,index*2)
            mon.clearLine()
            mon.write("  "..contents[2])
        else
            mon.setTextColor(colors.white)

            mon.setCursorPos(1,index*2-1)
            mon.clearLine()
            mon.write("#"..sender_id.." is OK")

            mon.setCursorPos(1,index*2)
            mon.clearLine()
            mon.write("  "..contents[2])
        end
    end

    sleep(1)
end
