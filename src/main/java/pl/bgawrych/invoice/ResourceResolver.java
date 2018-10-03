package pl.bgawrych.invoice;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ResourceResolver implements WebMvcConfigurer{
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("pdf/**").addResourceLocations("file:///C:/Users/Public/pdf/");
        //C:\Users\Bartłomiej\IdeaProjects\invoice\pdf
    }
}
