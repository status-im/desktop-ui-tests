#ifndef SETUP_H
#define SETUP_H

#include <QObject>
#include <QQmlEngine>
#include <QQmlContext>

#include <QDebug>

#define STR(x) #x

#ifdef PROJECT_PATH
#define PWD(x) STR(x)
#endif

class Setup : public QObject
{
    Q_OBJECT
public:
    explicit Setup(QObject *parent = nullptr);

public slots:
    void qmlEngineAvailable(QQmlEngine *engine)
    {
        engine->rootContext()->setContextProperty("myContextProperty", QVariant(true));
        engine->addImportPath(QString(PWD(PROJECT_PATH)) + "/status-desktop/ui/StatusQ/src");
        engine->addImportPath(QString(PWD(PROJECT_PATH)) + "/status-desktop/ui/imports");
    }
};

#endif // SETUP_H
