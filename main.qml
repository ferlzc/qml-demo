import QtQuick 2.8
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: app
    width: 1900
    height: 1080
    visible: true
    visibility: Window.FullScreen
    Material.theme: Material.Dark
    Material.accent: Material.Teal
    Material.foreground: Material.Blue

    Label {
        id: label
        x: parent.width/2 -50
        y: 36
        text: qsTr("Demo")
        font.pointSize: 36
    }

    StackLayout {
        id: stackLayout

        width: parent.width
        currentIndex: bar.currentIndex
        Item {
            id: inter

            Switch {
                id: switch1
                x: 1336
                y: 382
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
                x: 1333
                y: 548
                text: qsTr("Radio Button")
                scale: 1.25

            }

            RadioButton {
                id: radioButton1
                x: 1620
                y: 548
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
                x: 1609
                y: 421
                width: 149
                height: 56
                text: qsTr("Switch")
                scale: 1.25
            }


            Row {
                id: row
                x: 314
                y: 414
                width: 306
                height: 605

                Tumbler {
                    id: tumbler2
                    width: 120
                    height: 269
                    anchors.left: parent.left
                    anchors.leftMargin: -60
                    model: 10
                    scale:2
                }

                Tumbler {
                    id: tumbler1
                    width: 120
                    height: 269
                    anchors.left: parent.left
                    anchors.leftMargin: 60
                    model: 10
                    scale: 2
                }

                Tumbler {
                    id: tumbler
                    width: 120
                    height: 269
                    anchors.left: parent.left
                    anchors.leftMargin: 180
                    model: 10
                    scale: 2
                }
            }



            Row {
                id: row1
                x: 722
                y: 456
                width: 478
                height: 86
                z: 2

                BusyIndicator {
                    id: busyIndicator2
                    anchors.right: parent.right
                    anchors.rightMargin: 170
                    scale:1.5
                }

                BusyIndicator {
                    id: busyIndicator1
                    anchors.right: parent.right
                    anchors.rightMargin: 328
                    scale:1.5
                }

                BusyIndicator {
                    id: busyIndicator
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    scale:1.5
                }


            }
        }

        Item {
            id: touch
            Rectangle {
                id: rectangle
                x: 0
                y: 180
                width: app.width
                height: 800
                color: "#ffffff"
                MultiPointTouchArea {
                    maximumTouchPoints: 2
                    anchors.topMargin: parent
                    anchors.bottomMargin: parent
                    anchors.rightMargin: parent
                    anchors.fill: parent
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
            id: camera

            Image {
                id: image
                x: 632
                y: 540
                width: 318
                height: 210
                fillMode: Image.PreserveAspectFit
                source: "qrc:images/camera.svg"
            }

            Image {
                id: image1
                x: 1014
                y: 457
                width: 400
                height: 400
                scale: 0.5
                fillMode: Image.PreserveAspectFit
                source: "qrc:images/dna.svg"
            }
        }

        Item {
            id: configs

            Column {
                id: column
                x: 606
                y: 401
                width: 759
                height: 400
                spacing: 50

                Label {
                    id: label1
                    text: qsTr("Esquema de Cores")
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
        y: 176
        width: parent.width
        height: 38
        TabButton {
            text: qsTr("Interface")
        }
        TabButton {
            text: qsTr("Touch")
        }
        TabButton {
            text: qsTr("Camera")
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
