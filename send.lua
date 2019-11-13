rednet.open("left")

args = {...}
receiver_id = tonumber(args[1])
message = args[2]

rednet.send(receiver_id, message)