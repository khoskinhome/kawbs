Karl's Audible Warning Bike ( or Bluetooth ) System ( kawbs )
KAWBs ( pronounced korbs , although you can say K A W B S if you really want ! )
--------------------------------------------------------------------------------
2020-06-24
----------


The aim of this project is to inform a motorcycle rider of speed, and normal dash board indicators via a bluetooth audio connection to their helmet headset.
Thus the rider doesn't have to look at the dash as much, and is hopefully less likely to crash.

It might even be useful in cars, although seeing the dash on those is easier than on
a bike, so I don't really see the point.

It will use a Rapberry Pi, a USB OBD2 interface to the motocycle's computer and optionally use a USB GPS receiver, for speed or journey tracking (journey tracking is a future feature)

The aim is it will be designed to run on a Raspberry Pi. Probably best with a Pi 3 with Wifi and Bluetooth.
You could use a Pizero W , although they can be a bit slow, and they're hard to purchase.
A Pi 2 with bluetooth and wifi USB dongles.
A Pi 4, I don't know, maybe. On a Pi 4 , do you want the expense , PSU requirements, and cooling challenges ? Do you need something that powerful ? Maybe, maybe not.

The bluetooth will only be used for the audio connection to the headset. Bluetooth audio can be a bit flakyand thus trying to have a bluetooth OBD2 scanner doesn't seem like a good idea. I want reliable audio.

The wifi will also be switchable. Apparently bluetooth audio on a Pi can be badly affected by wifi running simultaneously. So most of the time the wifi will be off.


Why did I do this ?
-------------------
I recently became a middle aged motorcyclist. One of the things I've found is it's harder to safely look at the dash on a motorcycle as compared to a car, and also concentrate on riding. There's often a larger angle looking down at the dash, plus on a motorcycle you do need to be more focused on the road as compared to a car. Even small mistakes on motorcycles can be catastrophic. You can briefly lose minor control of a car and there is more leeway for correcting mistakes.

I did look at and consider commercially availabe Head Up Displays, but currently available ones look very expensive, and somewhat flaky, and become unsupported. Plus I came to the conclusion that my eyes should really be focusing on the road, not on an head up display.

Head up displays would be close to the eyes, even with clever optics, the eyes are not focussing on the road. So they could still be a distraction. Although I would like to test one.

A self made head up display looks hard to implement into the helmet in a safe and aesthetic way.
Bluetooth audio headsets, well there's lots of them already available. All I need to do is supply the audible warnings via a Raspberry Pi from the ODB2 , GPS sensor and some GPIO wiring into the motorcycles electrics.

Most ( all ? ) of the information I need could be audible.



Main Aims.
---------
Whilst riding the information that I've mainly found I need is :

    Current Speed (There are bluetooth smart phone apps that do this, but I haven't found a good one yet.)
    Are my indicators on. (more bikes should really have self cancelling indicators)
    Am I in too high a gear when I come to a stop. ( yes I am a new rider ! )


Nice to have would be :
    some warning light has come on.
    OBD2 is generating a fault code.
    low fuel warnings . Not essential since I really don't find I need to look at that often.

I also want easily available buttons on the handlebars to enable/disable audible warnings. Something that isn't possible or easy with bluetooth smart phone talking speedo apps. A physical, simple push button in a good place on the handlebars would be a lot better.

Logging of various ODB2 sensors could provide some interesting geeky statistics for those inclined to look at them. Probably not the average motorcyclist. I might be interested ...


Speed Camera alerts, and current road speed limit would be nice, but that would require DBs and maps. Currently beyond the initial scope of this project, unless I can find someway to linking what's available on a smart phone in someway, or someone else wants to contribute !


Control Interface.
------------------
The Pi will run a web gui, Wifi AP, so a smart phone can connect, and configure the options available.







