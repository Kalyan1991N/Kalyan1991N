import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "controls"
import "pages"


Window {
    id: mainwindow
    width: 1000
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("PPDM")

    // Remove title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    // Propeties
    property int windowStatus: 0
    property int windowMargin: 10

    //Internal Functions
    QtObject{
            id: internal

            function resetResizeBorders(){
                // Resize visibility
                resizeLeft.visible = true
                resizeRight.visible = true
                resizeBottom.visible = true
                resizeWindow.visible = true
            }

            function maximizeRestore(){
                if(windowStatus == 0){
                    mainwindow.showMaximized()
                    windowStatus = 1
                    windowMargin = 0
                    // Resize visibility
                    resizeLeft.visible = false
                    resizeRight.visible = false
                    resizeBottom.visible = false
                    resizeWindow.visible = false
                    btnMaximizeRestore.btnIconSource = "../images/svg_images/restore_icon.svg"
                }
                else{
                    mainwindow.showNormal()
                    windowStatus = 0
                    windowMargin = 10
                    // Resize visibility
                    internal.resetResizeBorders()
                    btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
                }
            }

            function ifMaximizedWindowRestore(){
                if(windowStatus == 1){
                    mainwindow.showNormal()
                    windowStatus = 0
                    windowMargin = 10
                    // Resize visibility
                    internal.resetResizeBorders()
                    btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
                }
            }

            function restoreMargins(){
                windowStatus = 0
                windowMargin = 10
                // Resize visibility
                internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }


    Rectangle {
        id: bg
        color: "#29003f"
        border.color: "#2c1d4b"
        border.width: 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        z:1

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

                ToggleButton {
                    onClicked: animationMenu.running = true
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

                    DragHandler{
                        onActiveChanged: if(active){
                                             mainwindow.startSystemMove()
                                             internal.ifMaximizedWindowRestore()
                                         }
                    }

                    Image {
                        id: iconapp
                        width: 22
                        height: 22
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/svg_images/icon_app_top.svg"
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

                            TopBarButton{
                                id: btnMinimize
                                onClicked:{
                                    mainwindow.showMinimized()
                                    internal.restoreMargins()
                                }

                            }

                            TopBarButton {
                                id: btnMaximizeRestore
                                btnIconSource: "../images/svg_images/maximize_icon.svg"
                                onClicked: internal.maximizeRestore()
                            }

                            TopBarButton {
                                id: btnClose
                                btnColorClicked: "#e03381"
                                btnIconSource: "../images/svg_images/close_icon.svg"
                                onClicked: mainwindow.close()
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

                    PropertyAnimation{
                        id: animationMenu
                        target: leftmenu
                        property: "width"
                        to:
                            if(leftmenu.width == 70)
                                return 250;
                            else
                                return 70;
                        duration: 500
                         easing.type: Easing.OutBounce
                    }

                    Column {
                        id: columnmenu
                        width: 70
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 90
                        anchors.topMargin: 0

                        LeftMenuBtn {
                            id: btnHome
                            width: leftmenu.width
                            text: qsTr("Home")
                            anchors.left: parent.left
                            anchors.top: parent.top
                            isActiveMenu: true
                            anchors.leftMargin: 0
                            anchors.topMargin: 0
                            onClicked: {
                                btnHome.isActiveMenu = true
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/homePage.qml"))
                            }
                        }

                        LeftMenuBtn {
                            id: btnPPDM
                            width: leftmenu.width
                            text: qsTr("Apply PPDM")
                            anchors.left: parent.left
                            anchors.top: btnHome.bottom
                            btnIconSource: "../images/svg_images/padlock.svg"
                            anchors.topMargin: 0
                            anchors.leftMargin: 0
                            onClicked: {
                                btnPPDM.isActiveMenu = false
                                btnPPDM.isActiveMenu = true
                                stackView.push(Qt.resolvedUrl("tabview.qml"))
                            }
                        }

                        LeftMenuBtn {
                            id: btnRan
                            width: leftmenu.width
                            text: qsTr("Random Forest")
                            anchors.left: parent.left
                            anchors.top: btnPPDM.bottom
                            btnIconSource: "../images/svg_images/layers.svg"
                            anchors.topMargin: 0
                            anchors.leftMargin: 0
                            onClicked: {
                                btnRan.isActiveMenu = false
                                btnRan.isActiveMenu = true
                                stackView.push(Qt.resolvedUrl("pages/randomForest.qml"))
                            }
                        }

                        LeftMenuBtn {
                            id: btnClu
                            width: leftmenu.width
                            text: qsTr("Clustering")
                            anchors.left: parent.left
                            anchors.top: btnRan.bottom
                            btnIconSource: "../images/svg_images/book.svg"
                            anchors.topMargin: 0
                            anchors.leftMargin: 0
                            onClicked: {
                                btnClu.isActiveMenu = false
                                btnClu.isActiveMenu = true
                                stackView.push(Qt.resolvedUrl("pages/Clustering.qml"))
                            }
                        }

                        LeftMenuBtn {
                            id: btnSvm
                            width: leftmenu.width
                            text: qsTr("SVM")
                            anchors.left: parent.left
                            anchors.top: btnClu.bottom
                            btnIconSource: "../images/svg_images/credit-card.svg"
                            anchors.topMargin: 0
                            anchors.leftMargin: 0
                            onClicked: {
                                btnSvm.isActiveMenu = false
                                btnSvm.isActiveMenu = true
                                stackView.push(Qt.resolvedUrl("pages/SVM.qml"))
                            }
                        }

                        LeftMenuBtn {
                            id: btnRegr
                            width: leftmenu.width
                            text: qsTr("Regression")
                            anchors.left: parent.left
                            anchors.top: btnSvm.bottom
                            btnIconSource: "../images/svg_images/bar-chart.svg"
                            anchors.topMargin: 0
                            anchors.leftMargin: 0
                            onClicked: {
                                btnRegr.isActiveMenu = false
                                btnRegr.isActiveMenu = true
                                stackView.push(Qt.resolvedUrl("pages/Regression.qml"))
                            }
                        }
                    }

                    LeftMenuBtn {
                        id: btnSettings
                        width: leftmenu.width
                        text: qsTr("Settings")
                        anchors.bottom: parent.bottom
                        clip: true
                        btnIconSource: "../images/svg_images/settings_icon.svg"
                        anchors.bottomMargin: 25
                        isActiveMenu: false
                        onClicked: {
                            btnHome.isActiveMenu = false
                            btnSettings.isActiveMenu = true
                            stackView.push(Qt.resolvedUrl("pages/settingsPage.qml"))
                        }
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

                    StackView {
                        id: stackView
                        anchors.fill: parent
                        clip: true
                        initialItem: Qt.resolvedUrl("homePage.qml")
                    }

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
                    MouseArea {
                        id: resizeWindow
                        x: 884
                        y: 0
                        width: 25
                        height: 25
                        opacity: 0.5
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 0
                        cursorShape: Qt.SizeFDiagCursor

                        DragHandler{
                            target: null
                            onActiveChanged: if (active){
                                                 mainwindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                             }
                        }

                        Image {
                            id: resizeImage
                            width: 16
                            height: 16
                            anchors.fill: parent
                            source: "../images/svg_images/resize_icon.svg"
                            anchors.leftMargin: 5
                            anchors.topMargin: 5
                            sourceSize.height: 16
                            sourceSize.width: 16
                            fillMode: Image.PreserveAspectFit
                            antialiasing: false
                        }
                    }
                }
            }
        }
    }
    DropShadow{
        anchors.fill: bg
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#80000000"
        source: bg
        z: 0
    }
    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

            DragHandler{
                target: null
                onActiveChanged:
                    if (active){
                        mainwindow.startSystemResize(Qt.LeftEdge)
                    }
            }
        }

        MouseArea {
            id: resizeRight
            width: 10
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            cursorShape: Qt.SizeHorCursor

                DragHandler{
                    target: null
                    onActiveChanged: if (active) { mainwindow.startSystemResize(Qt.RightEdge) }
            }
        }

        MouseArea {
            id: resizeBottom
            height: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 0
            cursorShape: Qt.SizeVerCursor

                DragHandler{
                    target: null
                    onActiveChanged: if (active) { mainwindow.startSystemResize(Qt.BottomEdge) }
            }
        }
        Connections{
                target: backend

                function onReadText(text){
                    actualPage.setText = text
                }

            }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
