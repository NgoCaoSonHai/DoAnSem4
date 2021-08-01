package sem.dao;

import java.util.List;

import sem.entities.sem_publisher;

public interface PublisherDAO {
	public List<sem_publisher> getPublishers();
	public boolean insertBook(sem_publisher p);
}
