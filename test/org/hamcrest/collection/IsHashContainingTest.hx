package org.hamcrest.collection;

import org.hamcrest.AbstractMatcherTest;
import org.hamcrest.Matcher;

class IsHashContainingTest extends AbstractMatcherTest
{
    override function createMatcher():Matcher<Dynamic>
    {
        return hasEntry("irrelevant", "irrelevant");
    }

	@Test
    public function testMatchesMapContainingMatchingKeyAndValue()
    {
        var map = new Map<String, Int>();
        map.set("a", 1);
        map.set("b", 2);

        assertMatches("matcherA", hasEntry("a", 1), map);
        assertMatches("matcherB", hasEntry(equalTo("b"), equalTo(2)), map);
    }
	
	@Test
    public function testMatchesMapContainingMatchingIntKeyAndValue()
    {
        var map = new Map<Int, String>();
        map.set(1, "a");
        map.set(2, "b");

        assertMatches("matcherA", hasEntry(1, "a"), map);
        assertMatches("matcherB", hasEntry(equalTo(2), equalTo("b")), map);
    }
	
    @Test
    public function shouldPrintMapKeyValueInMissmatch()
    {
        var map = new Map<String, Int>();
        map.set("a", 1);
        assertMismatchDescription("hash was [<a=1>]", hasEntry("a", 2), map);    
    }

	@Test
    public function testDoesNotMatchNull()
    {
        assertMismatchDescription("was null", hasEntry(anything(), anything()), null);
    }

	@Test
    public function testHasReadableDescription()
    {
        assertDescription("hash containing [\"a\"-><2>]", hasEntry(equalTo("a"), (equalTo(2))));
    }
}
