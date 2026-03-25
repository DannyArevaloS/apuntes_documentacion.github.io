# Hibernate

## ¿Qué es Hibernate?

Hibernate es un framework de mapeo objeto-relacional (ORM) para Java que facilita el mapeo de objetos Java a tablas de bases de datos relacionales y viceversa.

## Características Principales

### ORM (Object-Relational Mapping)
Hibernate elimina la necesidad de escribir código SQL manual al mapear automáticamente objetos Java a tablas de base de datos.

**Ventajas:**
- Reduce el código boilerplate
- Abstracción de la base de datos
- Portabilidad entre diferentes SGBD
- Manejo automático de relaciones

### JPA (Java Persistence API)
Hibernate es la implementación más popular de la especificación JPA.

## Arquitectura de Hibernate

```
┌─────────────────────────────────────┐
│      Aplicación Java                │
├─────────────────────────────────────┤
│      Hibernate API / JPA            │
├─────────────────────────────────────┤
│      SessionFactory                 │
├─────────────────────────────────────┤
│      Session / EntityManager        │
├─────────────────────────────────────┤
│      Transaction                    │
├─────────────────────────────────────┤
│      JDBC                           │
├─────────────────────────────────────┤
│      Base de Datos                  │
└─────────────────────────────────────┘
```

## Componentes Principales

### SessionFactory
- Objeto pesado que se crea una vez por aplicación
- Thread-safe
- Caché de segundo nivel
- Fábrica de objetos Session

### Session
- Objeto ligero que representa una conexión con la base de datos
- No es thread-safe
- Caché de primer nivel
- Gestiona el ciclo de vida de las entidades

### Transaction
- Representa una unidad de trabajo
- Abstracción sobre transacciones JDBC, JTA, etc.
- Garantiza ACID

## Configuración Básica

### hibernate.cfg.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE hibernate-configuration PUBLIC
    "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
    "http://hibernate.sourceforge.net/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
    <session-factory>
        <!-- Configuración de la base de datos -->
        <property name="hibernate.connection.driver_class">
            com.mysql.cj.jdbc.Driver
        </property>
        <property name="hibernate.connection.url">
            jdbc:mysql://localhost:3306/mibasededatos
        </property>
        <property name="hibernate.connection.username">usuario</property>
        <property name="hibernate.connection.password">contraseña</property>
        
        <!-- Dialecto SQL -->
        <property name="hibernate.dialect">
            org.hibernate.dialect.MySQL8Dialect
        </property>
        
        <!-- Configuración adicional -->
        <property name="hibernate.show_sql">true</property>
        <property name="hibernate.format_sql">true</property>
        <property name="hibernate.hbm2ddl.auto">update</property>
    </session-factory>
</hibernate-configuration>
```

## Mapeo de Entidades

### Usando Anotaciones JPA

```java
import javax.persistence.*;

@Entity
@Table(name = "usuarios")
public class Usuario {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "nombre", nullable = false, length = 100)
    private String nombre;
    
    @Column(name = "email", unique = true)
    private String email;
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "fecha_registro")
    private Date fechaRegistro;
    
    // Constructores, getters y setters
}
```

## Operaciones CRUD

### Crear (Create)

```java
Session session = sessionFactory.openSession();
Transaction tx = session.beginTransaction();

Usuario usuario = new Usuario();
usuario.setNombre("Juan Pérez");
usuario.setEmail("juan@example.com");

session.save(usuario);
tx.commit();
session.close();
```

### Leer (Read)

```java
Session session = sessionFactory.openSession();
Usuario usuario = session.get(Usuario.class, 1L);
session.close();
```

### Actualizar (Update)

```java
Session session = sessionFactory.openSession();
Transaction tx = session.beginTransaction();

Usuario usuario = session.get(Usuario.class, 1L);
usuario.setEmail("nuevo@example.com");

session.update(usuario);
tx.commit();
session.close();
```

### Eliminar (Delete)

```java
Session session = sessionFactory.openSession();
Transaction tx = session.beginTransaction();

Usuario usuario = session.get(Usuario.class, 1L);
session.delete(usuario);

tx.commit();
session.close();
```

## HQL (Hibernate Query Language)

HQL es un lenguaje de consulta orientado a objetos similar a SQL.

```java
Session session = sessionFactory.openSession();

// Consulta simple
String hql = "FROM Usuario WHERE nombre = :nombre";
Query query = session.createQuery(hql);
query.setParameter("nombre", "Juan Pérez");
List<Usuario> usuarios = query.list();

// Consulta con JOIN
String hql2 = "SELECT u FROM Usuario u JOIN u.pedidos p WHERE p.total > :monto";
Query query2 = session.createQuery(hql2);
query2.setParameter("monto", 100.0);
List<Usuario> usuariosConPedidos = query2.list();

session.close();
```

## Relaciones entre Entidades

### One-to-Many

```java
@Entity
public class Departamento {
    @Id
    @GeneratedValue
    private Long id;
    
    @OneToMany(mappedBy = "departamento", cascade = CascadeType.ALL)
    private List<Empleado> empleados;
}

@Entity
public class Empleado {
    @Id
    @GeneratedValue
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "departamento_id")
    private Departamento departamento;
}
```

### Many-to-Many

```java
@Entity
public class Estudiante {
    @Id
    @GeneratedValue
    private Long id;
    
    @ManyToMany
    @JoinTable(
        name = "estudiante_curso",
        joinColumns = @JoinColumn(name = "estudiante_id"),
        inverseJoinColumns = @JoinColumn(name = "curso_id")
    )
    private Set<Curso> cursos;
}
```

## Caché en Hibernate

### Caché de Primer Nivel (Session Cache)
- Habilitada por defecto
- Ámbito de sesión
- No configurable

### Caché de Segundo Nivel (SessionFactory Cache)
- Opcional
- Ámbito de aplicación
- Requiere configuración adicional (EHCache, Infinispan, etc.)

## Mejores Prácticas

1. **Usar SessionFactory como Singleton**: Es un objeto pesado, créalo una sola vez
2. **Cerrar siempre las Sessions**: Usa try-with-resources o finally
3. **Usar transacciones**: Incluso para operaciones de lectura
4. **Evitar N+1 queries**: Usa JOIN FETCH en HQL
5. **Lazy Loading**: Configura adecuadamente el fetching
6. **Batch Processing**: Para operaciones masivas
7. **Usar Named Queries**: Para consultas reutilizables

## Recursos Adicionales

📄 **[Descargar PDF: Clase de Hibernate](01_clase_hibernate.pdf)**

### Enlaces Útiles
- [Documentación oficial de Hibernate](https://hibernate.org/orm/documentation/)
- [Hibernate Tutorial - Baeldung](https://www.baeldung.com/hibernate-5)
- [JPA Specification](https://jakarta.ee/specifications/persistence/)

---

!!! warning "Importante"
    Hibernate puede generar muchas consultas SQL si no se configura correctamente. Siempre revisa las consultas generadas en desarrollo usando `show_sql=true`.

!!! tip "Consejo"
    Considera usar Spring Data JPA que simplifica aún más el uso de Hibernate eliminando mucho código boilerplate.
