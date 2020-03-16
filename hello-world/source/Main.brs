'*************************************************************
'** Hello World example 
'** Copyright (c) 2015 Roku, Inc.  All rights reserved.
'** Use of the Roku Platform is subject to the Roku SDK Licence Agreement:
'** https://docs.roku.com/doc/developersdk/en-us
'*************************************************************

'sub Main()
''    print "in showChannelSGScreen"
''    'Indicate this is a Roku SceneGraph application'
''    screen = CreateObject("roSGScreen")
''    m.port = CreateObject("roMessagePort")
''    screen.setMessagePort(m.port)
''
''    'Create a scene and load /components/helloworld.xml'
''    scene = screen.CreateScene("HelloWorld")
''    screen.show()
''
''    while(true)
''        msg = wait(0, m.port)
''        msgType = type(msg)
''        if msgType = "roSGScreenEvent"
''            if msg.isScreenClosed() then return
''        end if
''    end while
'end sub

sub Main()
    'create and display a roPosterScreen as a backdrop
    screen = CreateObject("roPosterScreen")
    port = CreateObject("roMessagePort")
    screen.SetMessagePort(port)
    screen.Show()

    'create our roMessageDialog
    dialog = CreateObject("roMessageDialog")
    ' give the dialog the same message port as the poster screen
    'so we can get events from both
    dialog.SetMessagePort(port)
    ' set the text of the dialog
    dialog.SetTitle("Hello Dollymeats!")
    ' add some buttons
    ' assign them different indexes so we can tell them apart
    ' when we handle their respective isButtonPressed() events
    dialog.AddButton(1, "Hello!")
    dialog.AddButton(2, "Ciao!")
    dialog.SetMenuTopLeft(true)
    ' display the dialog
    dialog.Show()
    ' event loop
    while true
        msg = wait(0, port) ' wait for an event
        ' make sure the message we got is of the type we expect
        if type(msg) = "roMessageDialogEvent"
            if msg.isButtonPressed()
            ' the user pressed a button on the roMessageDialog
            ' the index of the button assigned in the AddButton() function
            ' will correspond to the value returned by the event's GetIndex() function
            buttonIndex = msg.GetIndex()

            if buttonIndex = 1
                ' the user pressed the "Hello!" button
                screen.ShowMessage("You pressed Hello!")
            else 
                ' the user pressed the "Ciao!" button
                screen.ShowMessage("You pressed Ciao!")
            end if 
            dialog.Close()
        end if 
    else if type(msg) = "roPosterScreenEvent"
        if msg.isScreenClosed()
            ' the user closed the screen, exit the while loop
        exit while 
    end if
end if 
end while 

screen.Close()
' anytime all screens within a channel are closed, the channel will exit
end sub 
        




