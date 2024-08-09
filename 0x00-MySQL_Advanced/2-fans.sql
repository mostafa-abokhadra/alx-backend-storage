-- ranks country origins of bands
-- Ordered by the number of fans
-- Column must be origin and nb_fans

SELECT origin, SUM(fans) as nb_fans FROM metal_bands
GROUP BY origin ORDER BY nb_fans DESC;