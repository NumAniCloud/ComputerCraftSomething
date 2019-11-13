os.loadAPI("home/ensure")

ensure.setMainTerminalId(19)
ensure.sendOk()

args = {...}
cmds = args[1]

length = cmds:len()
print("command length = ", tostring(length))

for i = 1,length do
    cmd = cmds:sub(i,i)
    write(cmd)
    if cmd == "u" then
        ensure.up()
    elseif cmd == "d" then
        ensure.down()
    elseif cmd == "f" then
        ensure.forward()
    elseif cmd == "b" then
        ensure.back()
    elseif cmd == "l" then
        turtle.turnLeft()
    elseif cmd == "r" then
        turtle.turnRight()
    end
end

print("")
