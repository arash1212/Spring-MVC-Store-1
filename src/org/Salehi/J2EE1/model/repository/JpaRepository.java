package org.Salehi.J2EE1.model.repository;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class JpaRepository<T, I> {
    @PersistenceContext
    private EntityManager manager;

    @Transactional
    public void save(T t) {
        manager.persist(t);
    }

    @Transactional
    public void remove(T t) {
        manager.remove(manager.merge(t));
    }

    @Transactional
    public void update(T t) {
        manager.merge(t);
    }

    @Transactional
    public void updateOneIntFieldByID(Class<T> tClass, String fieldName, int value, long id) {
        Query query = manager.createQuery("update " + tClass.getAnnotation(Entity.class).name() + " set " + fieldName + "=:v where " + tClass.getAnnotation(Entity.class).name() + "id=:i").setParameter("v", value).setParameter("i", id);
        query.executeUpdate();
    }

    public T findOneByID(Class<T> tClass, I id) {
        return manager.find(tClass, id);
    }

    public T findOneByFieldName(Class<T> tClass, String fieldName, String fieldValue) {
        Query query = manager.createQuery("select entity from " + tClass.getAnnotation(Entity.class).name() + " as entity where entity." + fieldName + "=:f").setParameter("f", fieldValue);
        return (T) query.getSingleResult();
    }

    //
    public T findOneByChildId(Class<T> tClass, String childName, long id) {
        Query query = manager.createQuery("select entity from " + tClass.getAnnotation(Entity.class).name() + " as entity where entity." + childName + ".id" + "=:i").setParameter("i", id);
        return (T) query.getSingleResult();
    }

    //
    public T findOneByIdWithChild(Class<T> tClass, String childName, long id) {
        Query query = manager.createQuery("select entity from " + tClass.getAnnotation(Entity.class).name() + " as entity left join fetch entity." + childName + " where entity.id=:id").setParameter("id", id);
        return (T) query.getSingleResult();
    }

    public List<T> findAllByChildId(Class<T> tClass, String childName, long id) {
        Query query = manager.createQuery("select entity from " + tClass.getAnnotation(Entity.class).name() + " as entity where entity." + childName + ".id" + "=:i").setParameter("i", id);
        return query.getResultList();
    }
    //

    public List<T> findAllByFieldName(Class<T> tClass, String fieldName, String fieldValue) {
        Query query = manager.createQuery("select entity from " + tClass.getAnnotation(Entity.class).name() + " as entity where entity." + fieldName + "=:f").setParameter("f", fieldValue);
        return query.getResultList();
    }

    public List<T> findAllByChildFieldName(Class<T> tClass, String childName, String childFieldName, String fieldValue) {
        Query query = manager.createQuery("select entity from " + tClass.getAnnotation(Entity.class).name() + " as entity where entity." + childName + "." + childFieldName + "=:f").setParameter("f", fieldValue);
        return query.getResultList();
    }


    public T findOneByFieldName(Class<T> tClass, String fieldName, String fieldValue, String childName) {
        Query query = manager.createQuery("select entity from " + tClass.getAnnotation(Entity.class).name() + " as entity left join fetch entity." + childName + " where entity." + fieldName + "=:f").setParameter("f", fieldValue);
        return (T) query.getSingleResult();
    }

    public List<T> findAll(Class<T> tClass) {
        Query query = manager.createQuery("select entity from " + tClass.getAnnotation(Entity.class).name() + " as entity");
        return query.getResultList();
    }

    public List<T> findAllWithChild(Class<T> tClass, String childName) {
        Query query = manager.createQuery("select entity from " + tClass.getAnnotation(Entity.class).name() + " as entity left join fetch entity." + childName);
        return query.getResultList();
    }

    public List<T> get5lastItems(Class<T> tClass, String fieldName) {
        Query query = manager.createQuery("select entity from " + tClass.getAnnotation(Entity.class).name() + " as entity order by entity." + fieldName + " desc").setFirstResult(0).setMaxResults(5);
        return query.getResultList();
    }

    public List<T> findAllByUserIdAndNullChildField(Class<T> tClass, long id, String childName) {
        Query query = manager.createQuery("select entity from " + tClass.getAnnotation(Entity.class).name() + " as entity where entity.users.id=" + id + " and entity." + childName + " is null");
        return query.getResultList();
    }

    public List<T> pagination(Class<T> tClass, int pageNum) {
        int pageSize = 10;
        //
        int count = manager.createQuery("select count (entity.id) from " + tClass.getAnnotation(Entity.class).name() + " as entity").getMaxResults();
        //
        Query query = manager.createQuery("select entity from " + tClass.getAnnotation(Entity.class).name() + " as entity order by entity.id");
        query.setFirstResult((pageNum - 1) * 10);
        query.setMaxResults(pageSize);
        return query.getResultList();
        //
    }

    public List<T> paginationWithChildFieldName(Class<T> tClass, int pageNum, String childName, String fieldName, String fieldValue) {
        int pageSize = 10;
        //
        Query query = manager.createQuery("select entity from " + tClass.getAnnotation(Entity.class).name() + " as entity where entity." + childName + "." + fieldName + "=:f order by entity.id").setParameter("f", fieldValue);
        query.setFirstResult((pageNum - 1) * 10);
        query.setMaxResults(pageSize);
        return query.getResultList();
        //
    }

    public List<T> paginationWithChildID(Class<T> tClass, int pageNum, String childName, long id) {
        int pageSize = 10;
        //
        Query query = manager.createQuery("select entity from " + tClass.getAnnotation(Entity.class).name() + " as entity where entity." + childName + ".id=:f order by entity.id").setParameter("f", id);
        query.setFirstResult((pageNum - 1) * 10);
        query.setMaxResults(pageSize);
        return query.getResultList();
        //
    }
}
