package student.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.Properties;

@Configuration
@ComponentScan(basePackages = "student")
public class AppConfig{
    public AppConfig(){
        System.out.println("AppConfig invoked");
    }
    @Bean
    InternalResourceViewResolver getView(){
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/template/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Bean
    LocalSessionFactoryBean getSessionFactory(){
        LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
        factoryBean.setDataSource(getdataSource());
        factoryBean.setHibernateProperties(getProperty());
        factoryBean.setPackagesToScan("student.model");
        return factoryBean;
    }

    private DriverManagerDataSource getdataSource(){
        DriverManagerDataSource driversource = new DriverManagerDataSource();
        driversource.setDriverClassName("org.postgresql.Driver");
        driversource.setUrl("postgresql://root:JOKwvITpkhKeUqpPAsr1ZLmJMD9HTTL3@dpg-d40u7kfdiees73akeoa0-a/students_data_awan");
        driversource.setUsername("root");
        driversource.setPassword("JOKwvITpkhKeUqpPAsr1ZLmJMD9HTTL3");
        return driversource;
    }

    private Properties getProperty(){
        Properties properties = new Properties();
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
        properties.setProperty("hibernate.hbm2ddl.auto", "update");
        properties.setProperty("hibernate.show_sql", "true");
        return properties;
    }
}
