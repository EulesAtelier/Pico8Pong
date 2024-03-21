--pong
--created by minerva
score1=0
score2=0
lives=3
lives2 = 3
win1 =0 
win2=0
showstartscreen=true
--paddle1
 -- paddle
 padx=10
 pady=52
 padw=4
 padh=25
 -- ball
 colour = 16
 function movepaddle()
 if btn (2, 0) and pady > 0 then
 pady-=5
 elseif btn(3, 0) and pady+padh<127 then
 pady+=5
 end
 end
 --paddle2
 padx2=117
 pady2=52
 padw2=4
 padh2=25
 function movepaddletwo()
 if btn (2, 1) and pady2 > 0 then
 pady2-=5
 elseif btn(3, 1) and pady2+padh2 < 127 then
 pady2+=5
 end
 end
 function _init()
 ballx = 12
 bally = 50
 	startscreen()
 end
 
 function _update()
 if(showstartscreen!=true)then
	 movepaddle()
	 movepaddletwo()
	 moveball()
	 bounceball()
	 bouncepaddle()
	 bouncepaddletwo()
	 losedeadball()
	else 
		moveballtwo()
		bounceballtwo()
	end
 end
 
 function _draw()
	 if(showstartscreen==true)then
	 	startscreen()
 	else	
		 -- clear the screen
		 rectfill(0,0, 128,128, 3)
		 --draw the lives
		 for i=1,lives do
		 	spr(004, 30+i*8, 4)
		 end
		 for c=1,lives2 do
		 	spr(005, 60+c*8, 4)
		 end
		 --draw the score
		-- print(score1, 12, 6, 15)
		-- print(score2, 115, 6, 15)
		 -- draw the paddle2
		 rectfill(padx2,pady2, padx2+padw2,pady2+padh2, 15)
		 -- draw the paddle
		 rectfill(padx,pady, padx+padw,pady+padh, 15)
		 -- draw the ball
		 spr(colour,  ballx, bally,1,1)
		 --circfill(ballx,bally,ballsize,colour)
		 if(win1==1) then
		 	print('user 1 wins',40, 20, 15)
		 end
		 if(win2==1) then
		 	print('user 2 wins',40, 20, 15)
 		end
 	end
 end
 --ball
 ballx=64
 bally=64
 ballsize=2
 ballxdir=1
 ballydir=-1
 function moveball()
 ballx+=ballxdir
 bally+=ballydir
 end
function bounceball()
 -- top
 if bally+2 < ballsize then
 ballydir=-ballydir
 sfx(0)
 end
 -- bottom
 if bally+7 > 127 then
 ballydir=-ballydir
 sfx(0)
 end
end
 function bouncepaddle()
 if ballx-2>=padx 
 	and
	 	ballx-2<=padx+padw 
	 and
	 	bally>pady 
	 and 
	 	bally<pady+padh 
	 then
		 sfx(0)
		 ballxdir=-ballxdir
		 if(ballxdir<0) then
		 	ballxdir-=0.1
		 else 
		 	ballxdir+=0.1
	 end
	 if(ballydir>0) then
	 	ballydir+=0.1
	 else 
	 	ballydir-=0.1
	 end
 end 
end
 
 function bouncepaddletwo()
 if ballx+8>=padx2 
 	and
 		ballx+8<=padx2+padw2 
 	and
 		bally>pady2 
 	and 
 		bally<pady2+padh2 then
 			sfx(0)
 			ballxdir=-ballxdir
	 		if(ballxdir<0) then
		 		ballxdir-=0.1
		 	else 
		 		ballxdir+=0.1
		 	end
		 	if(ballydir<0) then
		 		ballydir-=0.1
		 	else 
		 		ballydir+=0.1
		 	end
 	end 
end
 
 function losedeadball() 
 if ballx<0
  then
 -- colour+=2
 	ballxdir = 1
 	ballydir = 1
  if lives>0 then
  --nextlife
		 sfx(3)
		 ballx=63
		 bally=63
		 score2+=1
		 lives-=1
 	else
 		ballydir=0
 		ballxdir=0
 		ballx = 63
 		bally = 63
 		win2=1;
 	end
 end
 if ballx>128 then
 	if lives2>0 then
  --nextlife
			 sfx(3)
			 ballx=63
			 bally=63
			 score1+=1
			 lives2-=1
 	else
 			ballydir=0
 			ballxdir=0
 			ballx = 63
 			bally = 63
 			win1=1
 	end
 end
end
 
 
function startscreen()
	if(btn(5) or btn(4)) then
		showstartscreen=false
		ballx = 64
		bally = 64
	else
		rectfill(0,0,127,127,3)
		rectfill(5,5,123,123,15)
		rectfill(10,10,117,117,3)
		spr(8, 32, 35, 8, 2)
		print('press z or x to start', 23, 80, 7)
		spr(colour, ballx, bally,1,1)
	end
end
function moveballtwo()
	if(ballx < 123 and ballx>5) then
 	ballx+=ballxdir
 else 
 ballxdir=-ballxdir
 end
 if(bally < 123 and bally>5) then
 	bally+=ballydir
 else 
 ballydir=-ballydir
 end 
end
function bounceballtwo()
 if bally-10 < 0 then
 ballydir=-ballydir
 sfx(0)
 end
 -- bottom
 if bally+20 >127 then
 ballydir=-ballydir
 sfx(0)
 end
 --left
 if ballx-10 < ballsize then
 ballxdir=-ballxdir
 sfx(0)
 end
 --right
 if ballx+17 > 127 then
 ballxdir=-ballxdir
 sfx(0)
 end
end
