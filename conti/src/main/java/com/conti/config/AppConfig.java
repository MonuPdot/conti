package com.conti.config;

import java.util.Properties;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.ResourceBundleViewResolver;

/**
 * @Project_Name conti
 * @Package_Name com.conti.config
 * @File_name AppConfig.java
 * @author Sankar
 * @Created_date_time Jun 20, 2017 2:21:39 PM
 * @Updated_date_time Jun 20, 2017 2:21:39 PM
 */

@EnableWebMvc
@Configuration
@ComponentScan({ "com.conti.*" })
@EnableTransactionManagement
@PropertySource("classpath:config.properties")
@Import({ SecurityConfig.class })
public class AppConfig {

	@Value("${mysql.url}")
	private String mysqlURL;
	
	@Value("${mysql.username}")
	private String mysqlUsername;
	
	@Value("${mysql.password}")
	private String mysqlPassword;
	
	@Bean
    public SessionFactory sessionFactory() {
        LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());
        builder
        	.scanPackages("com.conti.*")
            .addProperties(getHibernateProperties());

        return builder.buildSessionFactory();
    }

	private Properties getHibernateProperties() {
        Properties prop = new Properties();
        prop.put("hibernate.format_sql", "true");
        prop.put("hibernate.show_sql", "true");
        prop.put("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
        return prop;
    }
	
	@Bean(name = "dataSource")
	public BasicDataSource dataSource() {		
		BasicDataSource ds = new BasicDataSource();
	    ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl(mysqlURL);
		ds.setUsername(mysqlUsername);
		ds.setPassword(mysqlPassword);
		return ds;
	}

	
	@Bean
    public HibernateTransactionManager txManager() {
        return new HibernateTransactionManager(sessionFactory());
    }
		
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/pages/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	

	@Bean
	public ViewResolver getCsvViewResolver(){
		
		ResourceBundleViewResolver resolver = new ResourceBundleViewResolver();
		resolver.setBasename("views");
		resolver.setOrder(1);
		
		return resolver;
	}
	
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver getCommonsMultipartResolver() {
	    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
	    multipartResolver.setMaxUploadSize(20971520);   // 20MB
	    multipartResolver.setMaxInMemorySize(1048576);  // 1MB
	    return multipartResolver;
	}
	
	
	@Bean
	public AuthenticationSuccessHandler authenticationSuccessHandler() {
		return new CustomAuthenticationSuccessHandler();
	}
	
	
	@Bean
	public ContextLoaderListener contextLoaderListener() {
		return new ContextLoaderListener();
	}
	
	@Bean
    public HttpSessionEventPublisher httpSessionEventPublisher() {
            return new HttpSessionEventPublisher();
    }
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertyConfigInDev() {
		return new PropertySourcesPlaceholderConfigurer();
	}

}