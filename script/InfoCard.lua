function onCreate()
    local toughness = checkDifficulty()

	makeLuaSprite('bgThing', 'BlackBar', -500, 250) -- read wiki if you want to change this !!
    scaleObject('bgThing', 0.35, 0.43)
	setObjectCamera('bgThing', 'hud')
    addLuaSprite('bgThing', true)
    setScrollFactor('bgThing', 0, 0)
    setProperty('bgThing.alpha', tonumber(0.7))


    makeLuaText('songText', "".. songName.. " Composed by: composer".. toughness, 400, getProperty('bgThing.x') + -50, 320)
    setObjectCamera("songText", 'hud');
    setTextColor('songText', '0xffffff')
    setTextSize('songText', 30);
    addLuaText("songText");
    setTextFont('songText', "fontybot.ttf")
    setTextAlignment('songText', 'left')
    

    makeLuaText('beforeSongText', "Currently Playing: ", 300, getProperty('bgThing.x') + 100 - 40, 260)
    setObjectCamera("beforeSongText", 'hud');
    setTextColor('beforeSongText', '0xffffff')
    setTextSize('beforeSongText', 25);
    addLuaText("beforeSongText");
    setTextFont('beforeSongText', "fontybot.ttf")
    setTextAlignment('beforeSongText', 'left')


    setObjectOrder('beforeSongText', 3)
    setObjectOrder('songText', 3)
    setObjectOrder('bgThing', 2)
end

function onCreatePost()
    doTweenX('bgThingMoveIn', 'bgThing', -50, 0.6, 'linear')
    doTweenX('bgThingText', 'songText', 70, 0.6, 'linear')  -- might need to mess with these for longer names
    doTweenX('bgThingTextBleb', 'beforeSongText', 20, 0.6, 'linear')  -- might need to mess with these for longer names
    runTimer('moveOut', 3.7, 1)
end

function onUpdate()

end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'moveOut' then
        doTweenX('bgThingLeave', 'bgThing', -700, 0.6, 'linear')
        doTweenX('bgThingLeaveText', 'songText', -500, 0.6, 'linear')  -- might need to mess with these for longer names
        doTweenX('bgThingLeavePreText', 'beforeSongText', -400, 0.6, 'linear') -- might need to mess with these for longer names
    end
end

function onTweenCompleted(tag)
    if tag == 'bgThingLeave' then
        removeLuaSprite('bgThing', true)
        removeLuaText('songText', true)
        removeLuaText('beforeSongText', true)
    end
end

function checkDifficulty()
    -- read wiki if you want to code this in !!
    if difficulty == 2 then
        return '';
    elseif difficulty == 1 then
        return '';
    else
        return '';
    end

end
