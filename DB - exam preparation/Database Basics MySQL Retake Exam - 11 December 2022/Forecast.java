package softuni.exam.models.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import softuni.exam.models.entity.enums.DayOfWeek;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.time.LocalTime;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "forecasts")
public class Forecast extends BaseEntity {

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private DayOfWeek dayOfWeek;

    @Min(value = -50)
    @Max(value = 40)
    @Column
    private Double minTemperature;

    @Min(value = -20)
    @Max(value = 60)
    @Column
    private Double maxTemperature;

    @Column(nullable = false)
    private LocalTime sunset;

    @Column(nullable = false)
    private LocalTime sunrise;

    @ManyToOne
    private City city;
}
