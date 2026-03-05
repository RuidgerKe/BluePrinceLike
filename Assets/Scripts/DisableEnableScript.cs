using System.Collections;
using UnityEngine;

public class TimedDisable : MonoBehaviour
{
    // Set the delay time in the Inspector
    public float disableDelay = 7.5f;

    // Use Start() to run the coroutine when the object is first created/enabled
    void Start()
    {
        StartCoroutine(DisableAfterDelay());
    }

    // Coroutine to handle the delay
    IEnumerator DisableAfterDelay()
    {
        // Wait for the specified amount of time
        yield return new WaitForSeconds(disableDelay);

        // Disable the game object after the wait time
        gameObject.SetActive(false);
    }
}