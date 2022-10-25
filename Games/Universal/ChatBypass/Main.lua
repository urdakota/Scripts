--<< DONT EDIT UNLESS YOU KNOW WHAT YOUR DOING! >>--

local ifl = isfolder;
local cfl = makefolder;
local ifi = isfile;
local cfi = writefile;
local rfi = readfile;
local rq = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request or function(tbl) return {Body = game:HttpGet(tbl.Url)} end;

if not ifl("! Chat Bypass") then
    cfl("! Chat Bypass")
end

if not ifi("! Chat Bypass/Bypasses.json") then
  cfi("! Chat Bypass/Bypasses.json",rq({Url = "https://raw.githubusercontent.com/urdakota/Scripts/main/Games/Universal/ChatBypass/Bypasses.json",Method = "GET"}).Body)
end

local bypassedWords = game:GetService("HttpService"):JSONDecode(rfi("! Chat Bypass/Bypasses.json"))
local bypassStr = "%s{{aieixzvzx:%s}}"
local specialStr ="%s{{zczxczvzx:%s}}"

function bypassMessage(message)
    local bypassed = false
    for word, bypass in pairs(bypassedWords) do
        if string.find(message, word) then
            bypassed = true
            local bypassS, replace
            if string.find(bypass,"!") then
                bypassS = specialStr
                replace = bypass:split("!")
            elseif string.find(bypass,"_") then
                bypassS = bypassStr
                replace = bypass:split("_")
            end
            message = message:gsub(word,bypassS:format(replace[1], replace[2]))
        end
    end
    if bypassed then
        message = message .. " //fn\\💀"
    end
    return message 
end

local replicatedStorage = game:GetService("ReplicatedStorage")
local sayMessageReq     = replicatedStorage:FindFirstChild("SayMessageRequest", true)

local old__nameCall;
old__nameCall = hookmetamethod(game, "__namecall", function(self, ...)
   local method = getnamecallmethod()
   
   if (self == sayMessageReq) and (method == "FireServer") then
       local args = {...}
       local message = args[1]
       
       message = bypassMessage( message )
       
       args[1] = message
       
       return self.FireServer(self, unpack( args ) )    
   end
   
   return old__nameCall(self, ...)
end)
