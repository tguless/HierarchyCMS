package com.google.gwt.core.client;
import com.google.gwt.core.shared.*;
/**
 * Date: 1/17/13
 * Time: 12:37 PM
 * This class is used for fixing class not found com.google.gwt.core.client.GWTBridge;
 *
 * This is only needed for GXT 2 to work. Once we remove GXT2, this can be removed also.
 * https://stackoverflow.com/questions/22707020/gwt-error-java-lang-noclassdeffounderror-com-google-gwt-core-client-gwtbridge
 */
public abstract class GWTBridge extends com.google.gwt.core.shared.GWTBridge {
}