package com.websystique.springmvc.config;


import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@ComponentScan(basePackages ={"com.websystique.springmvc.dto"})
@EnableTransactionManagement
public class HibernateConfig {

    @Autowired
    SessionFactory sessionFactory;

    private final static String DATABASE_URL = "jdbc:h2:tcp://localhost/~/onlineshoping";
    private final static String DATABASE_DRIVER = "org.h2.Driver";
    private final static String DATABASE_DIALECT = "org.hibernate.dialect.H2Dialect";
    private final static String DATABASE_USERNAME = "sa";
    private final static String DATABASE_PASSWORD = "";

    @Bean
    public DataSource getDataSource(){
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName(DATABASE_DRIVER);
        dataSource.setUrl(DATABASE_URL);
        dataSource.setUsername(DATABASE_USERNAME);
        dataSource.setPassword(DATABASE_PASSWORD);

        return dataSource;
    }
    @Bean
    public SessionFactory getSessionFactory(DataSource dataSource){
        LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource);
        builder.addProperties(getHibernatePropertis());
        builder.scanPackages("com.websystique.springmvc.dto");
        return builder.buildSessionFactory();
    }


    private Properties getHibernatePropertis() {
    Properties properties = new Properties();
    properties.put("hibernate.dialect]", DATABASE_DIALECT);
    properties.put("hibernate.show_sql", true);
    properties.put("hibernate.format_sql", true);

    return properties;
    }
    @Bean
    public HibernateTransactionManager getTransactionMenager(SessionFactory sessionFactory){
        HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);

        return  transactionManager;
    }



}