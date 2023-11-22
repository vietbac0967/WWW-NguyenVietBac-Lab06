package com.fit.se.backend.utils;

import java.time.Instant;
import java.util.Date;

public class DateUtils {
    public static Date convertInstantToDate(Instant instant) {
        return Date.from(instant);
    }
}
