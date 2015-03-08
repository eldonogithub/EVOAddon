local AddOnName = "EVOAddon";

-- Declare EVOAddon globally so that it can be using in the frame XML
EVOAddon = LibStub("AceAddon-3.0"):NewAddon(
  AddOnName, -- Name of the addon
  "AceConsole-3.0", -- mixin
  "AceEvent-3.0" -- mixin
);

-- Enable debugging
EVOAddon.debugging = true;

-- Call AceAddon:Print from the AceConsole:Print
EVOAddon:Print("EVOAddon-Ui: Start");


-- Load the language defintions for this locale
local L = LibStub( "AceLocale-3.0" ):GetLocale( AddOnName, false );

function dumptable(prefix, t)
    for k, v in pairs(t) do
      if ( type(v) == "table" ) then
        print ( prefix .. k .. ": table" );
--        dumptable("  ", v);
      elseif ( type(v) == "function" ) then
        print ( prefix .. k .. ": function");
      elseif ( type(v) == "userdata" ) then
        print ( prefix .. k .. ": userdata");
      elseif ( type(v) == "thread" ) then
        print ( prefix .. k .. ": thread");
      elseif ( type(v) == "boolean" ) then
        print ( prefix .. k .. ": " .. tostring(v) );
      else
        print( prefix .. k .. ": " .. v ); 
      end
    end
end

-- static function handler for OnUpdate
local counter = 0;
local counter2 = 0;
function EVOAddon_OnUpdate(frame, elapsed)
  counter = counter + 1;
  if ( counter == 1 ) then
    print("frame: " .. type(frame));
    dumptable("", frame);
    print("EVOAddon: " .. type(EVOAddon) );
    dumptable("", EVOAddon);
  end
end

-- Called when the addon is Initialized by Ace3
function EVOAddon:OnInitialize()
  -- Called when the addon is Initialized by Ace3
  self:debug("OnInitialize");
end

--
function EVOAddon:ADDON_LOADED()
  self:debug("ADDON_LOADED event fired");
end

-- Called by FrameXML for OnLoad
function EVOAddon:HandleOnLoad(frame)
  self:debug("OnLoad called " );
end

-- Called by FrameXML for OnLoad
local counter = 0;
function EVOAddon:HandleOnUpdate(frame, elapsed)
  if ( counter == 0 ) then
    print("OnUpdate called");
  end
  counter = counter + 1;
end

-- Called by FrameXML for OnLoad
function EVOAddon:HandleOnEvent(frame, event)
  self:debug("OnEvent called");
end

-- The addon has been enabled
function EVOAddon:OnEnable()
    -- Called when the addon is enabled by Ace3
  EVOAddon.enabled = true;
  self:debug(format(L["EO_ADDON_STATE"], L["EO_ENABLED"]));
end

-- The addon has been disabled
function EVOAddon:OnDisable()
    -- Called when the addon is disabled by Ace3
  EVOAddon.enabled = false;
  
  self:debug(format(L["EO_ADDON_STATE"], L["EO_DISABLED"]));
end

-- Log debugging information 
function EVOAddon:debug( message )
  if ( EVOAddon.debugging ) then
    self:Print( format( L["EO_DEBUG"], message) );
  end
end

EVOAddon:Print("EVOAddon-Ui: end");
