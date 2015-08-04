public class DarkJedi {
  public Integer        jedisDefeated = 0;
  public static Integer totalJedisDefeated = 0;
 // system.debug('### jedisDefeated value at Line 2 : ' + jedisDefeated);
 // system.debug('### totalJedisDefeated value at Line 3 : ' + totalJedisDefeated);

  public void executeJedi() {
    // Wooosh vvvzzztt! AAHHHHH!
    system.debug('### Line 7 ');
    jedisDefeated      = jedisDefeated + 1;
    system.debug('### jedisDefeated value at Line 8 : ' + jedisDefeated);
    totalJedisDefeated = totalJedisDefeated + 1;
    system.debug('### totalJedisDefeated value at Line 10 : ' + totalJedisDefeated);
  }
}