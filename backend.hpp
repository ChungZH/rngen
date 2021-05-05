#ifndef BACKEND_HPP
#define BACKEND_HPP

#include <QDebug>
#include <QObject>
#include <QRandomGenerator>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int number READ number NOTIFY numberChanged)

  public:
    Backend()
    {
    }

    int number()
    {
        return m_number;
    }

  signals:
    void numberChanged();

  public slots:
    void genNumber(int minn, int maxx)
    {
        m_number = QRandomGenerator::global()->bounded(minn, maxx + 1);
        emit numberChanged();
    }

  private:
    int m_number;
};

#endif // BACKEND_HPP
