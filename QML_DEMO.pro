QT += quick quickcontrols2
CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS

TEMPLATE = app
TARGET = qml_demo

SOURCES += main.cpp \
    fps.cpp \

HEADERS += \
        fps.h

RESOURCES += qml.qrc

# Default rules for deployment.
target.path = /usr/bin/
!isEmpty(target.path): INSTALLS += target
