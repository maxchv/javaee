package org.itstep.task;


import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class TaskList {

    static private TaskList taskList;

    private Map<String, Task> tasks;

    private TaskList() {
        this.tasks = new ConcurrentHashMap<>();
    }

    public static TaskList getInstance() {
        if(taskList == null) {
            taskList = new TaskList();
        }
        return taskList;
    }

    public void addAndStart(String key, Task thread) {
        tasks.putIfAbsent(key, thread);
        thread.start();
    }

    public boolean isCompleted(String key) {
        Task t = tasks.getOrDefault(key, null);
        return t != null && !t.isAlive();
    }

    public long getResult(String key) {
        Task t = tasks.getOrDefault(key, null);
        return t.getResult();
    }

    public void removeTask(String key) {
        Task t = tasks.remove(key);
        t.interrupt();
    }

    public Set<String> taskKeys() {
        return tasks.keySet();
    }
}
