if ( cycle_timer >= 600 && cycle_timer <= 1800 )
{
   current_alpha =  daylight_alpha  ;
   current_colour = daylight_colour ;
}
else if ( cycle_timer >= 400 && cycle_timer <=600 )
{
   current_alpha =  night_alpha + ( daylight_alpha - night_alpha ) * ( cycle_timer - 400 ) / 200 ;
   current_colour = night_colour + ( daylight_colour - night_colour ) * ( cycle_timer - 400 ) / 200 ;
}
else if ( cycle_timer >= 1800 && cycle_timer <=2000 )
{
   current_alpha =  daylight_alpha + ( night_alpha - daylight_alpha ) * ( cycle_timer - 1800 ) / 200 ;
   current_colour = daylight_colour + ( night_colour - daylight_colour ) * ( cycle_timer - 1800 ) / 200 ;
} else {
   current_alpha =  night_alpha ;
   current_colour = night_colour ;
}
draw_set_alpha( current_alpha ) ;
draw_set_colour( current_colour ) ;
draw_rectangle( 0, 0, gui_wd, gui_hg, false ) ;
draw_set_alpha( 1 ) ;
draw_set_colour( c_white ) ;
var hr = floor( cycle_timer /100 ) ;
var mn = floor( ( cycle_timer - hr * 100 ) * 60 / 100 ) ;
draw_text( 10, 10, "Time: " + string( hr ) + " : " + string( mn ) ) ; // draw relative time on screen
