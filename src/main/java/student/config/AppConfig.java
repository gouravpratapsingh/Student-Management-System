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
        driversource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        driversource.setUrl("jdbc:mysql://localhost:3306/StudentMgmtSys?createDatabaseIfNotExist=true");
        driversource.setUsername("root");
        driversource.setPassword("2208");
        return driversource;
    }

    private Properties getProperty(){
        Properties properties = new Properties();
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
        properties.setProperty("hibernate.hbm2ddl.auto", "update");
        properties.setProperty("hibernate.show_sql", "true");
        return properties;
    }
}
