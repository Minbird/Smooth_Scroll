
if SERVER then return end -- error control when this file in shared.

local length = 0.5 -- animation length.
local ease = 0.25 -- easing animation IN and OUT.
local amount = 30 -- scroll amount.

hook.Add( "PreGamemodeLoaded", "Reloaded_DVScrollBar_Control", function()

	print("/////////////////////////////////")
	print("//    Smooth Scroll StartUp    //")
	print("/////////////////////////////////")
	print("By Minbird")
	print("System Version: 1.3")
	print("System Version Date: 2021.7.30")
	print("[Smooth Scroll] Trying to redefine controls...")

	local dermaCtrs = vgui.GetControlTable( "DVScrollBar" )

	local tScroll = 0
	local newerT = 0

	function dermaCtrs:AddScroll( dlta )

		local OldScroll = self:GetScroll()

		dlta = dlta * amount
		
		local anim = self:NewAnimation( length, 0, ease )
		anim.StartPos = OldScroll
		anim.TargetPos = OldScroll + dlta + tScroll
		tScroll = tScroll + dlta

		local ctime = RealTime() -- does not work correctly with CurTime, when in single player game and in game menu (then CurTime get stuck). I think RealTime is better.
		newerT = ctime
		
		anim.Think = function( anim, pnl, fraction )
			if ctime == newerT then
				self:SetScroll( Lerp( fraction, anim.StartPos, anim.TargetPos ) )
				tScroll = tScroll - (tScroll * fraction)
			end
		end

		return math.Clamp( self:GetScroll() + tScroll, 0, self.CanvasSize ) != self:GetScroll()

	end

	derma.DefineControl( "DVScrollBar", "Smooth Scrollbar", dermaCtrs, "Panel" )
	
	print("[Smooth Scroll] Redefine complete!")
	
end )