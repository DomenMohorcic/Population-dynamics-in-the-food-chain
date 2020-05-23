function plotRelations(dim, population, i1, i2, i3, fig)
  if (dim == 2)
    figure(fig);
    plot(population(i1, :), population(i2, :));
  elseif (dim == 3)
    figure(fig);
    plot3(population(i1, :), population(i2, :), population(i3, :));
  endif
endfunction