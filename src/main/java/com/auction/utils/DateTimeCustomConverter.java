package com.auction.utils;

import org.dozer.DozerConverter;

import java.time.LocalDateTime;

public class DateTimeCustomConverter extends DozerConverter<LocalDateTime, LocalDateTime> {

    public DateTimeCustomConverter() {
        super(LocalDateTime.class, LocalDateTime.class);
    }

    @Override
    public LocalDateTime convertTo(LocalDateTime source, LocalDateTime destination) {
        if (source == null) {
            return null;
        }
        return LocalDateTime.of(source.toLocalDate(), source.toLocalTime());
    }

    @Override
    public LocalDateTime convertFrom(LocalDateTime source, LocalDateTime destination) {
        if (source == null) {
            return null;
        }
        return LocalDateTime.of(source.toLocalDate(), source.toLocalTime());
    }
}
