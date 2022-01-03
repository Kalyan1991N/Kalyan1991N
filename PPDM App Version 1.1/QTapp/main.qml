import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: mainwindow
    width: 1000
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("PPDM")

    Rectangle {
        id: bg
        color: "#29003f"
        border.color: "#2c1d4b"
        border.width: 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 9
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        Rectangle {
            id: appcontainer
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 3
            anchors.leftMargin: 3
            anchors.bottomMargin: 3
            anchors.topMargin: 3

            Rectangle {
                id: topbar
                height: 60
                color: "#222222"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                Button {
                    id: toggle
                    width: 70
                    height: 60
                    text: qsTr("Toggle")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                }

                Rectangle {
                    id: topbardescp
                    y: 8
                    height: 34
                    color: "#232323"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.bottomMargin: 0

                    Label {
                        id: topbardes
                        color: "#d6d6d6"
                        text: qsTr("App for privacy preservation")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 10
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                    }

                    Label {
                        id: topbardes1
                        color: "#d6d6d6"
                        text: qsTr("HOME")
                        anchors.left: topbardes.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 0
                        font.pointSize: 10
                        anchors.rightMargin: 10
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                    }
                }

                Rectangle {
                    id: titlebar
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.topMargin: 0

                    Image {
                        id: iconapp
                        width: 28
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "qrc:/qtquickplugin/images/template_image.png"
                        anchors.leftMargin: 5
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: label
                        color: "#d6d6d6"
                        text: qsTr("Privacy Preserving Data Mining Application")
                        anchors.left: iconapp.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.pointSize: 12
                        anchors.leftMargin: 5

                        Row {
                            id: rowbar
                            x: 826
                            width: 105
                            height: 35
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.rightMargin: 0
                            anchors.topMargin: 0

                            Button {
                                id: button1
                                width: 35
                                height: 35
                                text: qsTr("Button")
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topbar.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                Rectangle {
                    id: leftmenu
                    width: 70
                    color: "#222222"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    Column {
                        id: columnmenu
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 90
                        anchors.topMargin: 0
                    }

                    Button {
                        id: button
                        text: qsTr("Button")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: 0
                        anchors.topMargin: 0
                    }
                }

                Rectangle {
                    id: contentarea
                    color: "#282828"
                    anchors.left: leftmenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0
                }

                Rectangle {
                    id: rectangle
                    width: 200
                    color: "#222222"
                    anchors.left: leftmenu.right
                    anchors.right: parent.right
                    anchors.top: contentarea.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: topbardes2
                        color: "#d6d6d6"
                        text: qsTr("App for privacy preservation")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 10
                        font.pointSize: 10
                        anchors.rightMargin: 30
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
