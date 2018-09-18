import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Particles 2.0

Item {
    width: app.width
    height: 800
    x:0
    y:250

    ParticleSystem {
        id: ps
    }
    ItemParticle {
        system: ps
        fade: false
        delegate: Rectangle {
            width: 30
            height: width
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
            radius: width/2
        }
    }

    Timer {

        interval: 100
        running: true
        repeat: true
        onTriggered:{
            emi_ang.angle = Math.floor(Math.random()*360)
            emitter.burst(1)
        }
    }

    Emitter {
        id: emitter
        system: ps
        emitRate: 0
        anchors.centerIn: parent
        lifeSpan: 4000
        size: 64
        velocity: AngleDirection {
            id: emi_ang
            angle: 180
            magnitude: 200
        }
    }

}
