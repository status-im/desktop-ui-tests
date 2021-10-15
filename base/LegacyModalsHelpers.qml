import QtQuick 2.14

import "../status-desktop/ui/shared" as Shared

QtObject {
    id: root

    property Shared.ModalPopup target: null

    property var header
    property var contentItem
    property var footer

    property Helpers __helpers: Helpers {}

    Component {
        id: headerComp
        QtObject {
            property Shared.StyledText title: null
            property var closeButton: null
        }
    }

    function findInContent(objectName) {
        if (root.contentItem) {
            return __helpers.getObjectByObjectName(root.contentItem, objectName)
        }

        return null
    }

    function findInFooter(objectName) {
        if (root.footer) {
            return __helpers.getObjectByObjectName(root.footer, objectName)
        }

        return null
    }

    Component {
        id: cbComponent
        QtObject {
            property Rectangle background: null
            property Shared.SVGImage icon: null
            property MouseArea sensor: null

            function click() {
                if (sensor) {
                    sensor.clicked()
                }
            }
        }
    }

    onTargetChanged: {
        if (target) {
            var hdr = __helpers.getObjectByObjectName(target.contentItem, "headerContent")
            var headerNew = headerComp.createObject()
            headerNew.title = __helpers.getObjectByObjectName(hdr, "titleText")

            var clbtn = __helpers.getObjectByObjectName(__helpers.getObjectByObjectName(target.contentItem, "closeButtonRectangle"))
            var icon = __helpers.getObjectByObjectName(clbtn, "closeImage")
            var sensor = __helpers.getObjectByObjectName(clbtn, "closeSensor")
            headerNew.closeButton = cbComponent.createObject(null, {
                                                                 background: clbtn,
                                                                 icon: icon,
                                                                 sensor: sensor
                                                             })
            root.header = headerNew

            root.contentItem = __helpers.getObjectByObjectName(target.contentItem, "contentParent")
            root.footer = __helpers.getObjectByObjectName(target.contetItem, "footerParent")
        }
    }
}
