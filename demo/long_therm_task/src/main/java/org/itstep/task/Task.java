package org.itstep.task;


import java.util.Random;
import java.util.concurrent.atomic.AtomicLong;

public class Task extends Thread {

    private AtomicLong atomicLong;
    public final int max;

    public Task() {
        atomicLong = new AtomicLong();
        max = new Random().nextInt(50_000);
    }

    // длительная операция
    @Override
    public void run() {
        while(atomicLong.get() < max) {
            atomicLong.incrementAndGet();
            try {
                sleep(5);
            } catch (InterruptedException e) {
                //e.printStackTrace();
            }
        }
    }

    /**
     * @return результат операции
     */
    public long getResult() {
        return atomicLong.get();
    }
}
