if SERVER then return end

local length = 0.5
local ease = 0.25
local amount = 25

hook.Add( "PreGamemodeLoaded", "Reloaded_DVScrollBar_Control", function()

	print("[Smooth Scroll] Trying to redefine controls...")

	local dermaCtrs = vgui.GetControlTable( "DVScrollBar" )

	local tScroll = 0
	local newerT = 0

	function dermaCtrs:AddScroll( dlta )

		local OldScroll = self:GetScroll()

		dlta = dlta * amount
		--chat.AddText(tostring(tScroll))
		
		local anim = self:NewAnimation( length, 0, ease )
		anim.StartPos = OldScroll
		anim.TargetPos = OldScroll + dlta + tScroll
		tScroll = tScroll + dlta

		--chat.AddText(OldScroll .. " / " .. dlta)
		
		local ctime = CurTime()
		newerT = ctime
		
		anim.Think = function( anim, pnl, fraction )
			if ctime == newerT then
				self:SetScroll( Lerp( fraction, anim.StartPos, anim.TargetPos ) )
				tScroll = tScroll - (tScroll * fraction)
			end
		end

		--self:SetScroll( self:GetScroll() + dlta )

		return OldScroll != self:GetScroll()

	end

	derma.DefineControl( "DVScrollBar", "Smooth Scrollbar", dermaCtrs, "Panel" )
	
	print("[Smooth Scroll] Redefine complete!")
	
end )

