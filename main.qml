import QtQuick 2.8
import QtQuick.Controls 2.0
import QtQuick.Controls 2.0 as QuickControls
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import FPS 1.0

ApplicationWindow {
    id: app
    width: 1920
    height: 1080
    visible: true
    //visibility: Window.FullScreen
    Material.theme: Material.Dark
    Material.accent: Material.Teal
    Material.foreground: Material.Blue

    /*
    FPSText{
        id: fps_text
        x:0
        y: 0;
        width: 200
        height: 100
        Text {
            anchors.centerIn: parent
            text: fps_text.fps.toFixed(2)
            anchors.verticalCenterOffset: -526
            anchors.horizontalCenterOffset: -777
        }
    }
    */

    StackLayout {
        id: stackLayout

        width: parent.width
        height: 1080
        currentIndex: bar.currentIndex
        Item {
            id: inter

            Switch {
                id: switch1
                x: 1520
                y: 306
                width: 154
                height: 117
                text: qsTr("Switch")
                scale: 1.25
            }

            Slider {
                id: slider
                x: 40
                y: 822
                width: 1820
                height: 59
                spacing: 0
                orientation: Qt.Horizontal
                value: 0.5
            }

            RadioButton {
                id: radioButton
                x: 1517
                y: 581
                text: qsTr("Radio Button")
                scale: 1.25

            }

            RadioButton {
                id: radioButton1
                x: 1517
                y: 691
                text: qsTr("Radio Button")
                scale:1.25
            }

            ProgressBar {
                id: progressBar1
                x: 32
                y: 972
                width: 1820
                height: 47
                clip: false
                rotation: 0
                indeterminate: true
                value: 0.5
            }

            Switch {
                id: switch2
                x: 1525
                y: 445
                width: 149
                height: 86
                text: qsTr("Switch")
                scale: 1.25
            }

            Row {
                id: row
                x: 164
                y: 414
                width: 653
                height: 605

                QuickControls.Tumbler {
                    id: tumbler2
                    width: 120
                    height: 269
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    scale:2
                    model: 10
                }

                QuickControls.Tumbler {
                    id: tumbler1
                    width: 120
                    height: 269
                    anchors.left: parent.left
                    anchors.leftMargin: 120
                    scale: 2
                    model: 10
                }

                QuickControls.Tumbler {
                    id: tumbler
                    width: 120
                    height: 269
                    anchors.left: parent.left
                    anchors.leftMargin: 240
                    scale: 2
                    model: 10
                }

                QuickControls.Tumbler {
                    id: tumbler3
                    width: 120
                    height: 269
                    anchors.left: parent.left
                    anchors.leftMargin: 360
                    scale: 2
                    model: 10
                }
            }

            Row {
                id: row1
                x: 794
                y: 456
                width: 478
                height: 86
                z: 2

                BusyIndicator {
                    id: busyIndicator2
                    anchors.right: parent.right
                    anchors.rightMargin: 300
                    scale:1
                }

                BusyIndicator {
                    id: busyIndicator1
                    anchors.right: parent.right
                    anchors.rightMargin: 200
                    scale:1
                }

                BusyIndicator {
                    id: busyIndicator
                    anchors.right: parent.right
                    anchors.rightMargin: 100
                    scale:1
                }

                BusyIndicator {
                    id: busyIndicator3
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    scale:1
                }

            }
        }

        Item {
            id: touch
            Rectangle {
                id: rectangle
                x: 0
                y: 162
                width: 1920
                height: 918
                color: "#ffffff"
                MultiPointTouchArea {
                    anchors.topMargin: 82
                    anchors.fill: parent
                    maximumTouchPoints: 2
                    touchPoints: [
                        TouchPoint { id: point1},
                        TouchPoint { id: point2}
                    ]
                }
            }

            Rectangle {
                width: 50; height: 50
                color: "green"
                x: point1.x
                y: point1.y
            }

            Rectangle {
                width: 50; height: 50
                color: "yellow"
                x: point2.x
                y: point2.y
            }
        }

        Item {
            id: particles

            Particles {
                x: 0
                y: 86
                width: 1920
                height: 984
            }

        }

        Item {
            CircularGauge {
                id: gauge
                x: 547
                y: 191
                width: 825
                height: 735
                style: CircularGaugeStyle {
                    needle: Rectangle {
                        y: outerRadius * 0.15
                        implicitWidth: outerRadius * 0.03
                        implicitHeight: outerRadius * 0.9
                        antialiasing: true
                        color: Qt.rgba(0.66, 0.3, 0, 1)
                    }
                }
                value: 5
                Behavior on value {
                    NumberAnimation {
                        duration: 1000
                    }
                }
            }
            Timer {
                interval: 900
                running: true
                repeat: true
                onTriggered: {
                    if (gauge.value === 100)
                    {
                     gauge.value = 0;
                    } else {
                    gauge.value += 10;
                    }
                }
            }
        }

        Item {
            id: configs

            Column {
                id: column
                x: 586
                y: 293
                width: 759
                height: 400
                spacing: 50

                Label {
                    id: label1
                    text: qsTr("Color Theme")
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                    transformOrigin: Item.Top
                    font.pointSize: 30
                }

                RadioButton {
                    id: radio3
                    text: qsTr("Black")
                    anchors.top: label1.bottom
                    anchors.topMargin: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                RadioButton {
                    id: radio4
                    text: qsTr("White")
                    anchors.horizontalCenterOffset: 0
                    anchors.top: radio3.bottom
                    anchors.topMargin: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

    TabBar {
        id: bar
        x: 0
        y: 38
        width: parent.width
        height: 38
        currentIndex: 0
        font.pointSize: 22
        TabButton {
            text: qsTr("Interface")
        }
        TabButton {
            text: qsTr("Touch")
        }
        TabButton {
            text: qsTr("Particles")
        }
        TabButton {
            text: qsTr("Gauge")
        }
        TabButton {
            text: qsTr("Configs")
        }
    }

    Connections {
        target: radio3
        onClicked: {
            app.Material.theme = Material.Dark
            app.Material.accent =  Material.Teal
            app.Material.foreground = Material.Blue
        }
    }

    Connections {
        target: radio4
        onClicked: {
            app.Material.theme = Material.White
            app.Material.accent =  Material.Orange
            app.Material.foreground = Material.Black
        }
    }

}

/*##^## Designer {
    D{i:23;anchors_height:800;anchors_width:1920;anchors_x:0;anchors_y:250}
}
 ##^##*/
