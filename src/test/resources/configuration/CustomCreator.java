
import com.helperPackage.objects.InstanceRecording;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = {"setup","com.ggproduct.automation.steps","com.helperPackage.actionsfactory.gherkin","com.helperPackage.register"},
        features = {"target/parallel/features/[CUCABLE:FEATURE].feature"},
        plugin = {"json:target/cucumber-report/[CUCABLE:RUNNER].json","com.helperPackage.controller.ReportingLogsPlugin"},
        tags = {"not @wip or @notFunctional"},
        monochrome = true,
        strict=true
)
public class CustomCreator {
}

