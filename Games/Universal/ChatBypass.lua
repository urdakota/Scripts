--[[ Add you own bypasses below ]]--

local bypassedWords = {
   ["gay"]       = "g_ay",
   ["ass"]       = "as_s",
   ["fag"]       = "f_ag",
   ["tit"]       = "ti_t",
   ["cum"]       = "c_um",
   ["sex"]       = "se_x",
   ["kys"]       = "ky_s",
   ["kill"]      = "ki_ll",
   ["porn"]      = "po_rn",
   ["fuck"]      = "fu_ck",
   ["shit"]      = "sh_it",
   ["tits"]      = "ti_ts",
   ["cock"]      = "c_ock",
   ["cunt"]      = "c_unt",
   ["cuck"]      = "c_uck",
   ["dick"]      = "di!ck",
   ["slut"]      = "slu_t",
   ["bitch"]     = "bi_tch",
   ["boobs"]     = "boo_bs",
   ["retard"]    = "ret_ard",
   ["retards"]   = "ret_ards",
   ["discord"]   = "disco_rd",
   ["pornhub"]   = "po_rnhub",
   ["testicles"] = "tes_ticles",
}

--<< DONT EDIT UNLESS YOU KNOW WHAT YOUR DOING! >>--

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
